---
id: 15
title: PHP frameworks war. Fight!
date: 2015-09-15T22:59:13+00:00
author: rtorralba
layout: post
guid: http://wordpress.artansoft.com/2015/09/15/php-frameworks-war-fight/
permalink: /2015/09/php-frameworks-war-fight/
tumblr_artansoft_permalink:
  - http://artansoft.tumblr.com/post/129175405783/php-frameworks-war-fight
tumblr_artansoft_id:
  - "129175405783"
interface_sidebarlayout:
  - default
dsq_thread_id:
  - "4846609775"
rop_post_url_twitter:
  - 'https://www.artansoft.com/2015/09/php-frameworks-war-fight/?utm_source=ReviveOldPost&utm_medium=social&utm_campaign=ReviveOldPost'
categories:
  - php
  - web
tags:
  - codeigniter
  - laravel
  - php
  - php development
  - PHP Framework
  - silex
  - simple mvc framework
  - slim
  - symfony
---
Uno de los grandes dilemas y origen de grandes discusiones es elegir un framework a la hora de empezar un proyecto PHP.

Bien, la verdad es que creo que no hay un mejor framework, sino que dependiendo de las características del proyecto será más adecuado usar uno u otro.

Dicho esto voy a opinar al respecto de los frameworks existentes actualmente. He realizado muchos proyectos con **<a href="http://www.codeigniter.com/" target="_blank">Codeigniter</a>**, un framework sencillo, con una curva de aprendizaje suave y bastante flexible, pero&hellip; Tras la actualización a la 3.0 han añadido algunas mejoras, pero no han incorporado las ventajas que las nuevas versiones de PHP cómo namespaces y continua haciendo uso de cosas cómo prefijos para clases y la clase loader. Por suerte parece que en la versión 4.0 esto se va arreglar y quedará más clara la estructura del mismo.

<!-- more -->

Bien, **<a href="http://www.codeigniter.com/" target="_blank">Codeigniter</a>**, funcional pero antiguo, ¿que framework escogemos?

<a href="https://symfony.com/" target="_blank"><b>Symfony 2</b></a>, a este no le falta de nada, un gran framework, pero aunque puedes usarlo para cualquier proyecto, tal vez parece más indicado para proyectos muy grandes y se necesita de una estructuración muy clara, poder subdividir el mismo en bundles y donde el bootstraping mayor de el mismo vale la pena porque después nos agiliza el gran trabajo que nos espera en un gran proyecto.

<a href="http://laravel.com/" target="_blank"><b>Laravel 5</b></a>, bueno, este me gusta mucho, casi no puedo sacarle ninguna pega, pero no se lo que ha pasado de la versión 4 a la 5, que aunque han añadido funcionalidades muy interesantes, el framework ha pasado a ser el más lento en los test de rendimiento.

Bien, ¿con cual nos quedamos? Pues casualmente he encontrado un framework sencillo, no tanto cómo **<a href="http://silex.sensiolabs.org/" target="_blank">Silex</a>** o **<a href="http://www.slimframework.com/" target="_blank">Slim</a>**, pero moderno, que permite el uso de namespaces y composer para extender las funcionalidades del mismo. Yo diría que podríamos decir que es un **<a href="http://www.codeigniter.com/" target="_blank">Codeigniter</a>** moderno. Este framework es **Simple MVC Framework**.

Creo que es un framework, sencillo, claro pero escalable añadiendo los packetes que necesitemos y que más nos gusten, por ejemplo, dos paquetes interesantes a añadir para reforzar este framework pueden ser **<a href="http://platesphp.com/" target="_blank">Plates</a>**, para estructurar las platillas PHP y **<a href="https://github.com/j4mie/idiorm" target="_blank">Idiorm</a>**, para tener un orm y no usar el simple query builder de **Simple MVC Framework**.

Dicho esto, cómo he dicho al principio, depende de para que proyecto sea el framework, y del gusto de cada uno.
