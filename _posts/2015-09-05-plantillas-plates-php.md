---
id: 16
title: Plates PHP, no a los lenguajes de plantillas
date: 2015-09-05T00:34:27+00:00
author: rtorralba
excerpt: |
  Platesphp nos da todas la funcionalidades de un sistema de plantillas cómo twig, smarty… Pero sin añadir una sintaxis nueva, lo cual nos evita aprender un lenguaje nuevo y todos los problemas anteriormente mencionados.
  
  Os dejo un enlace para que le echéis un vistazo y lo probéis, yo lo he probado con codeigniter 3 usando composer para instalarlo y es muy facil de usar y nos quita quebraderos de cabeza a la hora de reaprovechar código de plantillas. De hecho es el compañero perfecto de este framework que huye de los lenguajes de plantillas.
layout: post
guid: http://wordpress.artansoft.com/2015/09/05/platesphp-no-a-los-lenguajes-de-plantillas/
permalink: /2015/09/plantillas-plates-php/
tumblr_artansoft_permalink:
  - http://artansoft.tumblr.com/post/128368332543/platesphp-no-a-los-lenguajes-de-plantillas
tumblr_artansoft_id:
  - "128368332543"
interface_sidebarlayout:
  - default
hefo_before:
  - "0"
hefo_after:
  - "0"
dsq_thread_id:
  - "4833953602"
rop_post_url_twitter:
  - 'https://www.artansoft.com/2015/09/plantillas-plates-php/?utm_source=ReviveOldPost&utm_medium=social&utm_campaign=ReviveOldPost'
image: /wp-content/uploads/2015/09/php_html.png
categories:
  - php
  - web
tags:
  - php
  - plantilla
  - platesphp
  - template
---
Nunca me han gustado los lenguajes de plantillas ya que, en cuanto a sintaxis aportan muy poco respecto al código php:

Twig:

    {% if online == false %}
      <p>Sitio {{ site }} fuera de línea</p>
    {% endif %}
    

PHP:

    <? if($online == false): ?>
      <p>Sitio <?= $site ?> fuera de línea</p>
    <? endif ?>
    

Como podéis ver las diferencias en cuanto a limpieza son mínimas. Además el uso de plantillas complica el deploy de los proyectos:

  * Permisos en el servidor para el directorio de cache de plantillas.
  * Limpieza de cache.
  * Compilación de plantillas
  * Extracción de cadenas para traducción distinta del gettext…

<!-- more -->

No obstante las plantillas nos ofrecen unos mecanismos que el php no tiene:

  * Herencia.
  * Reutilización de código.
  * Declaración de bloques…

Ahí es donde entra <a href="http://platesphp.com" target="_blank" rel="noopener">platesphp</a>, <a href="http://platesphp.com" target="_blank" rel="noopener">platesphp</a> nos da todas la funcionalidades de un sistema de plantillas cómo twig, smarty… Pero sin añadir una sintaxis nueva, lo cual nos evita aprender un lenguaje nuevo y todos los problemas anteriormente mencionados.

Os dejo un enlace para que le echéis un vistazo y lo probéis, yo lo he probado con codeigniter 3 usando composer para instalarlo y es muy facil de usar y nos quita quebraderos de cabeza a la hora de reaprovechar código de plantillas. De hecho es el compañero perfecto de este framework que huye de los lenguajes de plantillas.

<a href="http://platesphp.com" target="_blank" rel="noopener">platesphp</a>
