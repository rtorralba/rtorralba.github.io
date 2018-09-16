---
id: 229
title: Vagrant. Entornos de desarrollo
date: 2016-03-20T23:54:30+00:00
author: rtorralba
excerpt: Vagrant, es un sistema para ejecutar maquinas virtuales de desarrollo. Por ejemplo, podemos tener una máquina virtual con un entorno LAMP (Linux, Apache, MySQL, PHP) instalado. de manera que tendremos un servidor web disponible para desarrollar.
layout: post
guid: http://www.artansoft.com/?p=229
permalink: /2016/03/vagrant-entornos-desarrollo/
hefo_before:
  - "0"
hefo_after:
  - "0"
dsq_thread_id:
  - "4846606934"
interface_sidebarlayout:
  - default
rop_post_url_twitter:
  - 'https://www.artansoft.com/2016/03/vagrant-entornos-desarrollo/?utm_source=ReviveOldPost&utm_medium=social&utm_campaign=ReviveOldPost'
image: /wp-content/uploads/2016/03/vagrant-logo-710.png
categories:
  - php
  - web
---
## Vagrant, ¿Que es?

Vagrant, es un sistema para ejecutar maquinas virtuales de desarrollo. Por ejemplo, podemos tener una máquina virtual con un entorno LAMP (Linux, Apache, MySQL, PHP) instalado. de manera que tendremos un servidor web disponible para desarrollar.

## Vagrant para unificar entornos

Con Vagrant podemos hacer que todo el equipo de desarrolladores trabajen con el mismo entorno, que además, conviene que sea el mismo que tenemos en producción, eliminando así posibles incompatibilidades entre producción y desarrollo y entre todos los integrantes del equipo.

Si seguimos con el ejemplo de PHP, sabréis que es conveniente que todos los desarrolladores tengan la misma versión del interprete. Si no es así, nos podría ocurrir que algunas funciones estén disponibles para unos y deprecadas para otros, funcionalidades nuevas que otros no tengan&#8230; Por no hablar de configuraciones distintas, mod_rewrite cargado, short open tags habilitadas&#8230;

## Distintos Sistemas Operativos

Con el uso de Vagrant no habrá ningún problema en que cada integrante del equipo use el sistema operativo que desee, Linux, Mac OS, Windows&#8230; Ya que el entorno donde se esta ejecutando el código es el mismo para todos dentro de la máquina virtual.

## Fácil instalación y mantenimiento

Aunque no es complicado instalar un entorno de desarrollo, con Vagrant sólo tendremos que descargar la configuración y levantar la máquina.

Siguiendo con el ejemplo del desarrollo web, todos sabréis las complicaciones que nos solemos encontrar en los distintos sistemas operativos, En Windows y Mac OS con wamp o Xampp, en linux distintas instalaciones según distribución.

## Ejemplo de maquina Vagrant para desarrollar en PHP

Por último, os dejo una máquina para el desarrollo web en PHP con la que podréis empezar a probar las ventajas que hemos explicado anteriormente. Es una máquina con Ubuntu 14.04 LTS (Trusty Tahr) cómo sistema operativo, LAMP y otras herramientas de desarrollo.

<a href="https://github.com/scotch-io/scotch-box" target="_blank">https://github.com/scotch-io/scotch-box</a>
