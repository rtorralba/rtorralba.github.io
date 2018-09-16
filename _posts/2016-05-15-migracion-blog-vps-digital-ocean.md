---
id: 251
title: Migración del Blog a un servidor VPS en Digital Ocean
date: 2016-05-15T21:57:12+00:00
author: rtorralba
excerpt: Hemos decidido migrar el blog a un servidor VPS para mejorar en rendimiento y flexibilidad para, por ejemplo, poder instalar el certificado SSL/TLS de Letsencrypt o habilitar la compresión para cargar las páginas de manera más rápida.
layout: post
guid: http://www.artansoft.com/?p=251
permalink: /2016/05/migracion-blog-vps-digital-ocean/
hefo_before:
  - "0"
hefo_after:
  - "0"
interface_sidebarlayout:
  - default
dsq_thread_id:
  - "4832855801"
rop_post_url_twitter:
  - 'https://www.artansoft.com/2016/05/migracion-blog-vps-digital-ocean/?utm_source=ReviveOldPost&utm_medium=social&utm_campaign=ReviveOldPost'
image: /wp-content/uploads/2016/05/server-1235959_960_720.jpg
categories:
  - php
  - web
---
## Blog a VPS. Introducción

Hemos decidido migrar el blog a un servidor VPS para mejorar en rendimiento y flexibilidad para, por ejemplo, poder instalar el certificado SSL/TLS de [Letsencrypt](https://letsencrypt.org/) o habilitar la compresión para cargar las páginas de manera más rápida.

## Digital Ocean

Tras barajar varias opciones y comentar con usuario que han probado distintos VPS no hemos decantado por [Digital Ocean](https://www.digitalocean.com/).

La creación de la máquina ha sido rápida, sencilla y eficiente. Y los precios son muy buenos y puedes ir escalando de una manera sencilla si vas necesitando mejor rendimiento, más espacio&#8230;

Un opción muy interesante que hemos habilitado es la creación de una copia de seguridad semanal del droplet.

## Instalación del software

Una vez creado el droplet con el sistema operativo nos ponemos a instalar el software, Apache 2, PHP 7, MySQL y todas las librerías que necesitan tanto Apache como PHP para inteactuar entre ellos y MySQL.

Ya sólo queda subir los archivos del blog y el dump de la base de datos del anterior servidor, crear el vistual host para el site, habilitarlo y reiniciar Apache.

En alrededor de 1 hora tienes un servidor LAMP con tu aplicaión PHP migrada y funcionando. La verdad es que realmente ágil.

## Creación del certificado SSL/TLS de Letsencrypt

Finalmente nos disponemos a crear el certificado SSL/TLS de [Letsencrypt](https://letsencrypt.org/) para servir nuestra página por https.

El procedimiento muy sencillo, además la gente de Letsencrypt han creado [Certbot](https://certbot.eff.org/), una aplicación que mediante un asistente te crea el certificado en un minuto. Seleccionas el servidor web y el sistema operativo y te muestra las instrucciones para instalar la herramienta.

### Certbot

Con [Certbot](https://certbot.eff.org/) un asistente te va guiando para crear el certificado.

  * Pregunta que servidor web estás utilizando, Apache o Lighttp, para nginx hemos leído que estará en breve.
  * Seleccionas para que sites quieres crear el certificado.
  * Eliges si quieres redireccionar el tráfico http a https (Recomendable).

## Conclusión

Cambio totalmente recomendable por todo respecto a un servidor compartido, rendimiento, flexibilidad, sencillez y escalabilidad.
