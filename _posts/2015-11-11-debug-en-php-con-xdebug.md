---
id: 6
title: Debug en PHP con xdebug
date: 2015-11-11T02:27:57+00:00
author: rtorralba
layout: post
guid: http://wordpress.artansoft.com/2015/11/11/debug-en-php-con-xdebug/
permalink: /2015/11/debug-en-php-con-xdebug/
tumblr_artansoft_permalink:
  - http://artansoft.tumblr.com/post/132974471243/debug-en-php-con-xdebug
tumblr_artansoft_id:
  - "132974471243"
interface_sidebarlayout:
  - default
hefo_before:
  - "0"
hefo_after:
  - "0"
dsq_thread_id:
  - "4835399323"
rop_post_url_twitter:
  - 'https://www.artansoft.com/2015/11/debug-en-php-con-xdebug/?utm_source=ReviveOldPost&utm_medium=social&utm_campaign=ReviveOldPost'
image: /wp-content/uploads/2015/11/debug_en_php_optimizada.jpg
categories:
  - php
  - vim
  - web
tags:
  - php
---
Muchos programadores de PHP y de lenguajes de scripting en general tienden a hacer debug imprimiendo mensajes por pantalla con funciones cómo **echo**, **var_dump**, **print_r**…

Lo cierto es que aunque es bastante sencillo el uso de estas funciones para ver que valores llegan a cierto punto de nuestra aplicación, no es recomendable, por el simple hecho de que esta forma de hacer debug nos hace modificar el código añadiendo una o más lineas, con lo que realmente no estamos comprobando el mismo código o hemos de prestar atención de que añadimos las lineas en el lugar correspondiente para que no afecte a la traza normal del mismo.

A parte de si nos gusta más o menos imprimir valores por pantalla, muchas veces habréis usado debuggers en otros lenguajes cómo java, c, c++… ¿Y porque no usarlo en PHP?

<!-- more -->

## Instalación de xdebug en Ubuntu.

    sudo apt-get install php5-xdebug
    

Editar el fichero de configuración del módulo xdebug que normalmente suele estar en /etc/php5/apache2/conf.d/20-xdebug.ini y añade las siguientes lineas:

    xdebug.remote_enable=1
    xdebug.remote_handler=dbgp
    xdebug.remote_mode=req
    xdebug.remote_host=127.0.0.1
    xdebug.remote_port=9000
    xdebug.max_nesting_level=300
    

Finalmente sólo nos queda reiniciar el servicio apache2.

    sudo service apache2 restart
    

Ahora cualquier IDE que este escuchando ese puerto podrá hacer debug de nuestra aplicación PHP. Para ello cada IDE tiene un sistema distinto, pero por lo general, suelen llamar al script PHP pasándole el paramétro XDEBUG\_SESSION\_START con valor 1.

E.g. http://test.local?XDEBUG\_SESSION\_START=1

Si el IDE que usáis no lo hace automáticamente podéis usar la extensión de chrome <a href="https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc?utm_source=chrome-app-launcher-info-dialog" target="_blank">xdebug helper</a> que añade esta variable automáticamente con un sólo clic en el icono de la extensión el la barra de direcciones del navegador.

## Haciendo debug en PHP con VIM

Por último si usáis VIM cómo IDE para PHP os recomiendo el plugin <a href="https://github.com/joonty/vdebug" target="_blank">vdebug</a> para hacer debug en vuestras aplicaciones PHP. És muy sencilla de usar y os permite hacer cualquier cosa que estéis acostumbrados a hacer con cualquier otro IDE, añadir breakpoints, ejecutar paso a paso entrando en las funciones o sin entrar, ver el valor de las variables…

Os dejo un vídeo demostración donde podréis ver cómo se hace debug de un pequeño script de prueba en VIM después de haber realizado todos los pasos del post, que aunque parecen muchos porque explico cada paso para que sirve, no son más que dos o tres.
