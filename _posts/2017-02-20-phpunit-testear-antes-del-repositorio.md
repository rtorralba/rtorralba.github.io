---
id: 361
title: PHPUnit. Testear la aplicación antes de subirla al repositorio.
date: 2017-02-20T01:29:56+00:00
author: rtorralba
excerpt: |
  Todos sabemos de la importancia de tener tests en nuestra aplicación con herramientas como PHPUnit para comprobar que todo funciona correctamente. Si estos tests detectan algún error, lo mejor es detectarlo lo antes posible, en es sentido es una buena práctica que cada desarrollador ejecute los tests en su propia máquina antes de subirlos al repositorio central y que los demás miembros del equipo se descarguen estos errores.
  
  Tenemos varias opciones para ejecutar los tests en el PC del desarrollador, podría hacer manualmente, pero esto sería engorroso y dependería de que este se acuerde de hacerlo antes de hacer git push al repositorio.
layout: post
guid: https://www.artansoft.com/?p=361
permalink: /2017/02/phpunit-testear-antes-del-repositorio/
interface_sidebarlayout:
  - default
related_posts:
  - 'a:3:{i:0;i:33;i:1;i:259;i:2;i:342;}'
dsq_thread_id:
  - "5806947831"
image: /wp-content/uploads/2017/02/phpunit-1-3.png
categories:
  - buenas-practicas
  - php
  - vim
tags:
  - git
  - php
  - phpunit
  - vim
---
## PHPUnit. Consideraciones generales.

Todos sabemos de la importancia de tener tests en nuestra aplicación con herramientas como PHPUnit para comprobar que todo funciona correctamente. Si estos tests detectan algún error, lo mejor es detectarlo lo antes posible, en es sentido es una buena práctica que cada desarrollador ejecute los tests en su propia máquina antes de subirlos al repositorio central y que los demás miembros del equipo se descarguen estos errores.

Tenemos varias opciones para ejecutar los tests en el PC del desarrollador, podría hacer manualmente, pero esto sería engorroso y dependería de que este se acuerde de hacerlo antes de hacer git push al repositorio.

Una manera común es hacer que estos tests se ejecuten antes de alguna acción que ejecutemos en nuestra máquina local, los podemos ejecutar antes de cada **commit** o antes de cada **push**.

En este sentido es cuestión de gustos, si lo añadimos antes de cada commit detectaremos el error antes, pero tendremos que ejecutarlos cada vez, y dependiendo del tamaño del proyecto puede tardar más de lo que desearíamos. Si por el contrario decidimos ejectuarlos antes del push, los detectaremos un poco más tarde, pero no trendremos que ejecutalos tantas veces, y la detección será antes de que se propague al repositorio central.

**Añadir la ejecución de los test antes del push.**

Para hacer que los tests se ejecuten justo antes de cada push, solo necesitaremos añadir el código de ejecución de estos en el **hook** definido para este fin en git **pre-push**. Os dejo un ejemplo que encontre en el GitHub de <a href="https://github.com/barryvdh" target="_blank">barryvdh</a>:

<pre class="brush: php; title: ; notranslate" title="">#!/usr/bin/env php
&lt;?php
echo &quot;Running tests.. &quot;;
exec('vendor/bin/phpunit', $output, $returnCode);
if ($returnCode !== 0) {
  // Show full output
  echo PHP_EOL . implode($output, PHP_EOL) . PHP_EOL;
  echo &quot;Cannot push changes untill tests are OK..&quot; . PHP_EOL;
  exit(1);
}
// Show summary (last line)
echo array_pop($output) . PHP_EOL;
exit(0);
</pre>

## Bonus track. Ejecutar los tests desde VIM

Para lo que usen el editor vim, os dejo una pequeña función que uso para ejecutar los tests desde vim de una manera cómoda:

<pre class="brush: plain; title: ; notranslate" title="">function Phpunit()
execute '!vendor/bin/phpunit'
endfunction
command Phpunit call Phpunit()
</pre>

De esta manera ejecutaremos con el comando :Phpunit la versión que tengamos en el proyecto actual, cosa que cosidero mejor que ejecutar el global porque los tests del proyecto estaran escritos para la versión que este usando el mismo.
