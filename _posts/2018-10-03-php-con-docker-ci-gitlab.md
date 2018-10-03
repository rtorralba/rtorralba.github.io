---
title: PHP con Docker. Integración Continua (CI) con Gitlab
date: 2018-10-02T23:15:11+02:00
author: rtorralba
excerpt: 'Partiendo de tener ya una configuración con Docker para el desarrollo en PHP, ahora, apoyandonos del servidor Gitlab, podemos mejorar un poco este entorno, hacer un build de la imagen Docker con la última versión del código, ejecutar los test que hayas implementados y si todos pasan satisfactoriamente, reemplazar los contendores de producción por otros con la nueva versión con zero downtime.'
layout: post
permalink: /2018/07/php-con-docker-integracion-continua-ci-gitlab/
categories:
  - Docker
  - PHP
  - Web
  - Gitlab
---
## Testing y deploy con Gitlab. Introducción

Partiendo de tener ya una configuración con Docker para el desarrollo en PHP, ahora, apoyandonos del servidor Gitlab, podemos mejorar un poco este entorno, hacer un build de la imagen Docker con la última versión del código, ejecutar los test que hayas implementados y si todos pasan satisfactoriamente, reemplazar los contendores de producción por otros con la nueva versión con zero downtime.

## Docker registry de Gitlab

Gitlab nos ofrece un docker registry que podremos usar tanto para el desarrollo como para el despliegue de contenedores docker. Para quien no esté familiarizado con este servicio, un docker registry es un servidor donde podemos subir nuestras imágenes de docker y descargarlas en otros equipos o servidores, es decir, podemos tener nuestro docker hub privado.

En la fase del desarrollo, una vez tenemos definido un Dockerfile para nuestro proyecto, podemos contruir la imagen del mismo y subirlo a nuestro docker registry. De esta manera, los demás programadores solo tendrán que descargar la imagen y no hacer el build cada uno de ellos.

En cuanto a la integración continua, este docker registry nos permitirá bajarnos la imagen para el proyecto con la última versión del código para ejecutar los test y si el resultado es satisfactorio, subir esta imágen actualizada al docker registry para actualizarla en producción.

## ¿Como hago que Gitlab haga todo esto por mi?

Gitlab ya tiene la posibilidad de añadir un fichero de configuración en yml (.gitlab-ci.yml) en tu proyecto donde especificar que se debe hacer y en que condicinoes para desplegar nuestro proyecto.

Viendo este fichero veréis que lo que a priori parece muy complicado, en este fichero con unas cuantas lineas es sencillo de especificar.

### gitlab-ci.yml

```yml
image: docker:latest
services:
- docker:dind

stages:
- build
- test
- release

variables:
  TEST_IMAGE: tu.dominio.gitlab.com:5555/ruta/proyecto:$CI_COMMIT_REF_NAME
  RELEASE_IMAGE: tu.dominio.gitlab.com:5555/ruta/proyecto:prod

before_script:
  - docker login -u gitlab-ci-token -p $CI_JOB_TOKEN tu.dominio.gitlab.com:5555

build:
  stage: build
  script:
    - docker build --pull -t $TEST_IMAGE .
    - docker push $TEST_IMAGE

test:
  stage: test
  script:
    - docker pull $TEST_IMAGE
    - docker run $TEST_IMAGE php vendor/bin/phpunit --coverage-text --colors=never

release:
  stage: release
  script:
    - docker pull $TEST_IMAGE
    - docker tag $TEST_IMAGE $RELEASE_IMAGE
    - docker push $RELEASE_IMAGE
    - ssh user@server "bash /ruta/script-intercambio-de-contenedores.sh"
  only:
    - master
```

Sin entrar en la explicación exacta de cada sección, ya que está disponible en la documentación de Gitlab, el flujo que está definido en el fichero es el siguiente. Cada push a las ramas de Gitlab se ejecutan los stages de build y test, y si el push es en la rama master el deploy:

#### Variables

Definimos las urls de la imagen de test y de producción en nuestro docker registry.

#### Before script

Nos logueamos en el docker registry usando el gitlab-ci-token para que no nos pida la contraseña.

#### Build

Construimos la imagen de test con la última versión del código y la subimos al docker registry.

#### Test

Descargamos la imagen de test del docker registry y ejecutamos los test con phpunit. Aunque por el nombre de la herramienta parece que solo se van ejecutar test unitarios, los que la conozcan un poco sabrán que tambien se pueden implementar otro tipo de tests como los de integración.

#### Release

Si los test dan todos un resultado correcto, contruiremos la imágen de producción y la subiremos al docker registry y ejecutaremos el script de deploy para que la descargue y sustituya los contendores por otros con la nueva versión.

Hay otras herramientas con las que podriamos hacerlo como docker swarm, kubernetes... pero está ha sido nuestra primera aproximación a un despliegue con docker. En otro post explicaré como funciona el script que, usando la estrategia blue-green, intercambia los contendores con la versión antigua del código por unos con la versión nueva bajo un haproxy con zero downtime.


#### Mostrar la cobertura del código en nuestro proyecto

Para mostrar la cobertura del código en nuestro proyecto, en el caso de PHP, deberemos tener el modulo de xdebug en la imágen y ejecutar los test con las opciones:

```bash
php vendor/bin/phpunit --coverage-text --colors=never
```

Además habrá que definir la expresión regular para que este pueda estraer la ejecución de los test el resultado de los mismos. Para ello tendremos que ir al apartado del proyecto settings-CI/CD-General pipelines, ye en la opción Test coverage parsing añadir el siguiente texto:

```bash
^\s*Lines:\s*\d+.\d+\%
```

Con ello, en cada ejecución del de CI podrás ver una columa con la cobertura del código en la misma y añadir un badge al README.md del proyecto, por ejemplo, con la cobertura de la última ejecución.

## Nota.

Algunos os preguntaréis, ¿porque tener una imagen para producción y otra para desarrollo y testing?

Para tener contenedores correndo en producción nos interesa que sean lo más ligeros posible con las aplicaiones que realmente necesitan. En el caso de PHP, en producción no necesitamos aplicaciones como xdebug o phpunit que si que nos vendrán bien en desarrollo y producción.
