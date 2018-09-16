---
id: 7
title: Programar en PHP siguiendo un estándar
date: 2015-10-14T00:24:34+00:00
author: rtorralba
layout: post
guid: http://wordpress.artansoft.com/2015/10/14/programar-en-php-siguiendo-un-estandar/
permalink: /2015/10/programar-en-php-siguiendo-un-estandar/
tumblr_artansoft_permalink:
  - http://artansoft.tumblr.com/post/131122096073/programar-en-php-siguiendo-un-estandar
tumblr_artansoft_id:
  - "131122096073"
interface_sidebarlayout:
  - default
hefo_before:
  - "0"
hefo_after:
  - "0"
dsq_thread_id:
  - "4838799159"
rop_post_url_twitter:
  - 'https://www.artansoft.com/2015/10/programar-en-php-siguiendo-un-estandar/?utm_source=ReviveOldPost&utm_medium=social&utm_campaign=ReviveOldPost'
image: /wp-content/uploads/2015/10/php_code_800.jpg
categories:
  - php
  - vim
tags:
  - coding-standards
  - php
  - ubuntu
---
Normalmente cada programador PHP tiene unas costumbres a la hora de usar un lenguaje de programación, poner las llaves en la siguiente linea o en la misma, a 80 lineas, usando tabuladores o espacios, cerrar las llaves en la misma linea o en la siguiente…

E.g.:

    while ($variable_name < 10) {
      $variable_name++;
    }
    
    while ($variableName < 10)
    {
      $variableName++
    }
    

<!-- more -->

Lo cierto es que la gran variedad de posibilidades hace que cuando vayamos a escribir cualquier sentencia no tengamos claro cómo lo habíamos hecho antes y que los proyectos tengan distintos estándares haciendo que su lectura y mantenimiento sea más difícil.

Este problema se agranda cuando tenemos que compartir código en un grupo de programadores. Por ello lo ideal en cualquiera de los casos es elegir un estándar y seguirlo.

Hay distintos y podéis elegir el que más os guste, para PHP recomendamos el <a href="http://www.php-fig.org/psr/psr-2/" target="_blank">PSR-2</a>.

## PHP Codesniffer para comprobar si seguimos el estándar.

Es complicado acordarnos de todas las normas de memoria, por lo que es de mucha utilidad que instaléis el codesniffer para que compruebe si el código se ha escrito siguiendo el estándar y sino donde están los errores.

    sudo apt-get install php-codesniffer
    

Una vez instalado podremos hacer uso del comando phpcs para comprobar el código:

    phpcs --standard=PSR2 file.php
    

## PHP Coding Standards Fixer

Cuando sepamos que errores tiene el código los podemos arreglar a mano o usar una herramienta que lo haga automáticamente.

<a href="http://cs.sensiolabs.org/" target="_blank">PHP Coding stardards</a> de sensiolabs nos ayudará con este cometido.

## Integración en VIM

Todo esto tiene buena pinta, pero programar y tener que ir ejecutando comandos en la consola no és muy cómodo. Lo ideal es que el IDE tenga integrado el chequeo y la posibilidad de reparar el coding standard.

Para VIM tenemos un plugin que ya checkea la syntaxis, <a href="https://github.com/scrooloose/syntastic" target="_blank">syntastic</a>, añadiendo una línea de configuración en el .vimrc nos comprobará también el estandar de programación:

    let g:syntastic_php_phpcs_args='--standard=PSR2'
    

Si además queremos arreglar automáticamente los posibles errores que nos vayan apareciendo podemos ejecutar el comando de sensiolabs:

    :!php-cs-fixer fix %
    

Y para no tener que recordarlo mapearlo en un comando también en el .vimrc:

    command PHPCSFix !php-cs-fixer fix %
    

Esperamos que os sirva de ayuda este post. Siguiendo un estándar en nuestra programación nuestro código mantendra un orden y si trabajamos en equipo hará que sea más entendible por todo el grupo.
