---
id: 309
title: CMS PHP WordPress con GIT y Ansistrano para el deploy
date: 2016-11-01T18:25:33+00:00
author: rtorralba
excerpt: |
  En ocasiones, en según que proyectos, y tratando de seguir el principio DRW (Don't Reinvent the Wheel), puede ser que elijamos algún CMS para hacer un proyecto ya que, si se adapta a lo queremos hacer... ¿Para que volverlo a desarrollar?
  
  No obstante hay que tener cuidado con esto, puede ser positivo usar CMS cómo Drupal, Wordpress... Pero no hay que dejar de lado cosas básicas para trabajar correctamente en un proyecto cómo un repositorio de código cómo GIT, Mercurial... Un sistema de despliegue cómo Ansistrano, Magallanes, Capistrano...
layout: post
guid: https://www.artansoft.com/?p=309
permalink: /2016/11/php-wordpress-con-git-y-ansistrano/
hefo_before:
  - "0"
hefo_after:
  - "0"
interface_sidebarlayout:
  - default
dsq_thread_id:
  - "5270607081"
image: /wp-content/uploads/2016/11/4919659112_70f8836dfa.jpg
categories:
  - php
  - web
tags:
  - ansistrano
  - git
  - wordpress
---
## WordPress con Git y Ansistrano. Introducción.

En ocasiones, en según que proyectos, y tratando de seguir el principio DRW (Don&#8217;t Reinvent the Wheel), puede ser que elijamos algún CMS PHP para hacer un proyecto ya que, si se adapta a lo queremos hacer&#8230; ¿Para que volverlo a desarrollar?

No obstante hay que tener cuidado con esto, puede ser positivo usar CMS cómo Drupal, WordPress&#8230; Pero no hay que dejar de lado cosas básicas para trabajar correctamente en un proyecto cómo un repositorio de código cómo GIT, Mercurial&#8230; Un sistema de despliegue cómo Ansistrano, [Magallanes](https://www.artansoft.com/2015/12/magallanes-herramienta-para-deploy-en-php/), Capistrano&#8230;

## Peculiaridades de los CMS

Muy bien, vamos ha realizar un proyecto con un CMS, WordPress por ejemplo, y para ello vamos a usar varios entornos, desarrollo y producción cómo mínimo, un repositorio de código, GIT y un sistema de deploy Ansistrano, ahí vienen los problemas.

Cómo muchos sabréis los cms hacen ciertas cosas que los hacen un poco complicados a la hora de tenerlos bajo GIT, por ejemplo guardan algunos contenidos cómo páginas estáticas en la base de datos, por lo que en ese caso o podríamos llevar el control de los cambios en las mismas sólo con GIT.

Además WordPress puede realizar cambios sobre la base de datos, crear tablas, campos&#8230; Por ejemplo cuando instalamos un nuevo plugin y por supuesto, cambios en el contenido de la misma. Esto escaparía también a la monitorización del repositorio.

## ¿Cómo lo monto?

### Se organizado.

Esta bien que pruebes distintos plugins, temas, etc&#8230; Pero una vez lo tengas claro, deja sólo aquello que realmente vayas a utilizar, el tema elegido con la personalización si queréis mantener el tema actualizado y sólo los plugins que en principio vayas a usar.

### Desarrolla todo lo que puedas en ficheros.

Cómo te he comentado anteriormente, puedes crear contenido cómo páginas básicas en el propio wordpress escapándose así los cambios de las mismas del repositorio de código. El CMS PHP WordPress te ofrece la manera de [realizar la misma página en un fichero dentro del tema](https://make.wordpress.org/themes/2014/06/28/correct-handling-of-static-front-page-and-custom-blog-posts-index-template/), quedando guardado así el mismo y cualquier cambio que realicemos.

### Instalación ordenada de plugins.

Los plugins pueden realizar cambios en la base de datos, pero antes de instalarlos debemos probar su funcionamiento. Para ello probaremos primero en local y después desplegaremos al servidor:

  1. Sincronizaremos la base de datos (estructura y sólo los datos del plugin) con alguna herramienta cómo MySQL workbench.
  2. Desplegaremos el código con Ansistrano.

En el caso de que seáis varios desarrollando, podéis designar un responsable para la instalación de plugins.

### Que pongo y que no en GIT.

Podemos usar el **.gitignore** que encontramos en [github](https://github.com/github/gitignore/blob/master/WordPress.gitignore). Se están incluyendo los temas y los módulos, de ahí la necesidad de ser organizados y tener lo estrictamente necesario.

Lo ideal, ya que no tenemos que mantener los módulos, sería que estuvieran fuera del repositorio, como en composer. En este caso la instalación y actualización de los mismos se realiza a través de wordpress, con lo que los mantendremos en el repositorio para desplegarlos cuando los instalemos.

### Configuración de Ansistrano.

En cuanto a la configuración del deploy con ansistrano, en lineas generales tenéis que tener en cuenta que la carpeta uploads debe estar fuera del las releases como shared path para no perderla entre deploys y ocurre lo mismo con el fichero wp-config.php, que debe estar fuera del repositorio, teniendo cada entorno el suyo propio, por lo que tendremos que añadirlo cómo shared file.

## Otras opciones.

  * [Con capistrano y wp-deploy](https://elbauldelprogramador.com/crear-un-entorno-de-desarrollo-para-wordpress-con-git-capistrano-y-wp-deploy/).
  * [Con GIT y composer](https://deliciousbrains.com/storing-wordpress-in-git/).
