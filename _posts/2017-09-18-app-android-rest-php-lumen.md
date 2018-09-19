---
id: 579
title: App Android y servidor REST con microframework PHP Lumen
date: 2017-09-18T00:45:15+00:00
author: rtorralba
excerpt: Debido a la creciente moda del seguimiento e ofertas a través de blogs, redes sociales, telegram... Surgió la idea de realizar una app que haga un recopilatorio de estas en una app android para los que no son usuarios de estos medios, o simplemente quieren tenerlo todo centralizado y categorizado.
layout: post
guid: https://www.artansoft.com/?p=579
permalink: /2017/09/app-android-rest-php-lumen/
interface_sidebarlayout:
  - default
related_posts:
  - 'a:3:{i:0;i:13;i:1;i:14;i:2;i:409;}'
dsq_thread_id:
  - "6151600680"
rop_post_url_twitter:
  - 'https://www.artansoft.com/2017/09/app-android-rest-php-lumen/?utm_source=ReviveOldPost&utm_medium=social&utm_campaign=ReviveOldPost'
image: /wp-content/uploads/2017/09/ofertas-diagram-3.png
categories:
  - android
  - mobile
  - php
  - web
---
## App Android. Introducción.

Debido a la creciente moda del seguimiento e ofertas a través de blogs, redes sociales, telegram&#8230; Surgió la idea de realizar una app que haga un recopilatorio de estas en una app android para los que no son usuarios de estos medios, o simplemente quieren tenerlo todo centralizado y categorizado.

Para ello se escogieron las siguientes tecnologías:

  * Servidor: 
      * LAMP (PHP 7)
      * <a href="https://lumen.laravel.com/" target="_blank" rel="noopener">Lumen</a>
      * Memcached
  * Cliente 
      * App Android nativa (Java) 
          * Librerías 
              * Picasso para la descarga de imágenes
              * Okhttp3 para las peticiones HTTP
              * Crashlytics para la monitorización de errores

## Servidor PHP con Lumen

Para el servidor pense en un micro framework PHP para que funcionara los más rápido posible. Elegí Lumen para aprovechar y de paso probar el microframework de Laravel.

Siguiendo la premisa de optimizar la velocidad, no active las facades y el orm Eloquent.

Además, para evitar consultas a las base de datos, instalé Memcached para cachear las los datos durante 5 minutos y realizar así sólo una consulta en este intervalo.

## Aplicación Nativa Android

Para la aplicación elijo la distribución navigation drawer con el menú lateral. La visualización está hecha con un RecyclerView Adapter con la librería Picasso para descargar y aplicar las imágenes a los CardViews.

La idea es que la app tenga una cierta cache para que se mueva rápido y no tenga que hacer peticiones cada vez que se cambie de categoría. Inicialmente probé guardarlo en una base de datos SQLite, pero el rendimiento era malísimo y tardaba mucho en realizar todo el proceso de actualización de la misma. Cambié guardando los datos en las SharedPreferences de la aplicación consiguiendo así un rendimiento mucho mejor y con ello mucha más velocidad.

Podéis probar el resultado final en <a href="https://play.google.com/store/apps/details?id=com.artansoft.ofertas" target="_blank" rel="noopener">Google play</a>. Dejad vuestros comentarios en la página y/o en Google play y puntuad la aplicación positivamente ;P.

<img src="/uploads/2017/09/mockDrop_Nexus-6-at-Apple-workstation_xicoteta.jpg" alt="" width="800" height="533"/>
