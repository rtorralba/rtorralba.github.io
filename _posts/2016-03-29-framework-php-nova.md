---
id: 239
title: Framework PHP Nova. La nueva versión de Simple MVC
date: 2016-03-29T02:01:56+00:00
author: rtorralba
excerpt: |
  Ha llegado la nueva versión, 3.0, de Simple MVC Framework PHP y con ella un cambio de nombre pero no de filosofía.
  
  Nova framework es sencillo con una curva de aprendizaje muy suave, actual, usando la últimas características de PHP, compatible con PHP 7 y escalable.
  
  La idea es tener un framework MVC básico, sin ORM, sin lenguaje de plantillas... muy sencillo sin complicaciones pero que puede añadir nuevas funcionalidades a través de paquetes de composer.
layout: post
guid: http://www.artansoft.com/?p=239
permalink: /2016/03/framework-php-nova/
hefo_before:
  - "0"
hefo_after:
  - "0"
interface_sidebarlayout:
  - default
dsq_thread_id:
  - "4838900499"
image: /wp-content/uploads/2016/03/nova.png
categories:
  - php
  - web
---
### Framework PHP Nova, sencillo pero potente

Ha llegado la nueva versión, 3.0, de Simple MVC Framework PHP y con ella un cambio de nombre pero no de filosofía.

Nova framework es sencillo con una curva de aprendizaje muy suave, actual, usando la últimas características de PHP, compatible con PHP 7 y escalable.

La idea es tener un framework MVC básico, sin ORM, sin lenguaje de plantillas&#8230; muy sencillo sin complicaciones pero que puede añadir nuevas funcionalidades a través de paquetes de composer.

Que necesito un ORM cómo Doctrine o Eloquent, lo añado, pero si no necesito complicar un proyecto no lo hago.

<!--more-->

### Mejoras añadidas

#### Reorganización del proyecto

El código se ha reorganizado quedando la carpeta system con el código del framework PHP en el primer nivel del proyecto fuera de app, dejando los ficheros propios de la aplicación en esta última y en la carpeta public el fichero de entrada a la app index.php y el .htaccess

#### Rutas con parámetros opcionales y grupos

Ahora podemos agrupar rutas, de manera que por ejemplo podemos poner en el mismo grupo todas las rutas que estén dentro de admin.

```php
Router::group('admin', function() {
    Router::any('add', 'App\Controllers\Demo@cool');
    Router::any('settings', 'App\Controllers\Demo@nice');
});
```

Esto sería equivalente a

```php
Router::any('admin/add', 'App\Controllers\Admin@add');
Router::any('admin/settings', 'App\Controllers\Admin@settings');
```

#### Utilidad CLI para crear controladores y modelos

Han añadido una utilidad CLI para crear controladores y modelos de una manera rápida.



Para más información y otras mejoras podéis consultar la <a href="http://novaframework.com/blog/nova-3-0-released-bp" target="_blank" class="broken_link">página oficial del framework</a>.

### Experiencia de uso

Tras varios meses de uso de la versión anterior, tenemos que decir que es un framework muy recomendable para aquellos que buscan una opción sencilla estilo Codeigniter pero actual o que simplemente prefieren seguir la filosofía Keep It Simple.

Se ha comportado muy bien, no hemos tenido ningún problema y si hemos necesitado alguna funcionalidad adicional simplemente la hemos añadido con composer, manteniendo así la sencillez original.

Ahora todas las mejoras refuerzan este framework cómo opción para el desarrollo de cualquier aplicación PHP.
