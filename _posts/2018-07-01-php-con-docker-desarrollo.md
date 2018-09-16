---
id: 639
title: PHP con Docker. Desarrollo usando contenedores
date: 2018-07-01T17:15:11+00:00
author: rtorralba
excerpt: 'Tras realizar el curso de postgrado Curso de Experto Desarrollo Ágil con Java, React y Docker de la Universitat Jaume I, hemos empezado a aplicar todas las ventajas que ofrece el desarrollo y despliegue de aplicaciones PHP con Docker. No voy a explicar todas las funcionalidades que ofrece Docker para centrarme en su aplicación en proyectos PHP. Además, para que no se alarguen demasiado el post, lo voy a dividir en tres partes, desarrollo, este post, test y despliegue. '
layout: post
guid: https://www.artansoft.com/?p=639
permalink: /2018/07/php-con-docker-desarrollo/
interface_sidebarlayout:
  - default
related_posts:
  - 'a:3:{i:0;i:361;i:1;i:593;i:2;i:229;}'
image: /wp-content/uploads/2018/07/14098888813_1047e39f08.jpg
categories:
  - Docker
  - PHP
  - Web
---
## PHP con Docker. Introducción

Tras realizar el curso de postgrado [Curso de Experto Desarrollo Ágil con Java, React y Docker](http://www.fue.uji.es/desarrollo-agil) de la [Universitat Jaume I](https://www.uji.es/), hemos empezado a aplicar todas las ventajas que ofrece el desarrollo y despliegue de aplicaciones PHP con Docker. No voy a explicar todas las funcionalidades que ofrece Docker para centrarme en su aplicación en proyectos PHP. Además, para que no se alarguen demasiado el post, lo voy a dividir en tres partes, desarrollo, este post, test y despliegue.

## Estado actual de PHP. La jungla.

En el estado actual de PHP, Docker viene como anillo al dedo. Como sabréis, con docker podemos hacer que la aplicación se ejecute en un contenedor con lo mínimo que necesite esta para ejecutarse. En el caso de PHP, el interprete del mismo, apache o nginx, algunas librerías como gd&#8230; Con esto, conseguimos que un desarrollador pueda ejecutarla y desarrollar la misma solamente levantando el contenedor.

Esto es una alegría para cualquier desarrollador de PHP, que ahora muy posiblemente tiene que convivir con, aparte de las distintas librerías que pueda necesitar cada aplicación por separado, todas las versiones que actualmente están manteniéndose en este lenguaje de desarrollo web. PHP 5.6, 7.0, 7.1, 7.2 7.3&#8230; E incluso, igual tiene algunas aplicaciones legacy con 5.3.

## La aplicación

Para esta explicación he elegido una aplicación desarrollada con el framework [Laravel](https://laravel.com/) 5.6, usando las migrations de la base de datos que nos permitirán, levantar una base de datos que conectaremos con nuestro contenedor para desarrollo, y otra in memory usando el motor sqlite, para ejecutar los tests en una base de datos temporal.

## Docker Compose. Configuración para desarrollo

Como os he explicado en el apartado anterior, como muchas aplicaciones PHP, esta necesita una base de datos para ejecutarse, por lo que usamos docker compose para levantar 2 servicios e interconectarlos entre si bajo la misma red, la aplicación, y la base de datos.

### Dockerfile

<pre><code class="docker">FROM php:7.2-apache

RUN apt-get update && apt-get install -y libmcrypt-dev git \ 
    mysql-client zip unzip libmagickwand-dev --no-install-recommends \ 
    && pecl install imagick \
    && pecl install mcrypt-1.0.1 \
    && pecl install xdebug \
    && docker-php-ext-enable imagick \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-install pdo_mysql \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && a2enmod rewrite \
    && service apache2 restart

WORKDIR /var/www
</code></pre>

Como podréis ver, estamos partiendo de la imagen php:7.2-apache, instalamos todas las librerias que necesitamos, el gestor de paquetes PHP composer y finalmente habilitamos el módulo rewrite de apache. Este es el Dockerfile del servicio donde se ejecutará la aplicación.

### docker-compose.yml

<pre><code class="yml">version: '3.1'

volumes:
    my-datavolume:
        driver: local
services:
    php: 
        build:
            dockerimage: Dockerfile
            context: .
        working_dir: /var/www
        ports:
            - 8081:80
        volumes:
            - .:/var/www
            - ./000-default.conf:/etc/apache2/sites-available/000-default.conf:ro
            - ~/.ssh:/root/.ssh
        links:
            - db 
        depends_on:
            - db
    db:
        image: mysql
        ports:
            - 33066:3306
        environment:
            MYSQL_DATABASE: mydatabase
            MYSQL_ROOT_PASSWORD: mypassword
        volumes:
            - my-datavolume:/var/lib/mysql
        healthcheck:
            test: mysql --user=root --password=mypassword -e "select 1"
            interval: 3s
            timeout: 10s
            retries: 10
</code></pre>

En este fichero de configuración de docker-compose, vemos que levantaremos dos servicios:

  * la applicación PHP, que depende de la base de datos, porque la aplicación no funciona si no puede conectar de la misma, y usa el Dockerfile anteriormente explicado para crear el contenedor donde se ejecutará.
  * La base de datos, a la que le hemos definido un volumen para que persista entre ejecuciones Como detalle, para asegurar que la base de datos ya está levantada, definimos un healthcheck que cada 3 segundos intentará una consulta simple en la misma. Usamos en el contenedor el fichero de configuración de apache, 000-default.conf, que tenemos en nuestro proyecto.

<pre><code class="apache">&lt;VirtualHost *:80&gt;
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/public

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined

  &lt;Directory /var/www/public&gt;
    Options Indexes
    FollowSymLinks
    AllowOverride
    All Require all granted
  &lt;/Directory&gt;
&lt;/VirtualHost&gt;
</code></pre>

Otra peculiaridad es que estamos compartiendo nuestra configuración ssh con el contenedor en la app porque tenemos paquetes composer privados en nuestro repositorio, y necesitamos acceso ssh para bajarlos.

## Inicialización

Esta parte es algo común en proyectos PHP laravel, y no está relacionada con Docker, pero es un conjunto de acciones que deberemos realizar al clonar la primera vez el proyecto, por lo que lo hemos agrupado en un script init.sh.

<pre><code class="bash">#!/usr/bin/env bash 

composer install

if [[ ! -f ./.env ]]; then
    cp ./.env.example ./.env
    php artisan key:generate
fi

php artisan migrate:fresh --seed
php artisan storage:link

chmod -R 775 storage
</code></pre>

  * Instalamos las dependencias
  * Copiamos la configuración de entorno y generamos la key de la aplicación.
  * Ejecutamos las migraciones con el parámetro &#8211;seed para que nos llene la base de datos de datos de prueba.
  * Creamos el enlace simbólico de la carpeta storage.
  * Damos permiso de escritura a apache a la carpeta storage.

Con todo esto, cuando un desarrollador se descarge el proyecto sólo tendrá que ejecutar dos comandos para empezar a trabajar, el segundo sólo la primera vez:

  * docker-compose up
  * docker-compose exec php ./init.bash

## Test unitarios

Es conveniente ejecutar los [test unitarios](https://www.artansoft.com/2017/02/phpunit-testear-antes-del-repositorio/) en nuestros PCs ya que son rápidos de ejecutar y nos permitirá subir código libre de errores al repositorio. Para ello con docker, podemos ejecutarlos como en cualquier proyecto, solamente teniendo en cuenta que en este caso este está dentro de contenedor en un entorno creado con docker-compose, por lo que podemos hacer lo siguiente:

<pre><code class="bash">docker-compose exec php vendor/bin/phpunit 
</code></pre>

Si usamos editores avanzados como PHPStorm, están preparados para ejecutar los test a través de contenedores. Al final ejecutan el mismo comando pero nos facilitan la labor pudiéndolo hacer con un clic.