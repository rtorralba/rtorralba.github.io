---
id: 10
title: EasyGrep para vim, Busca en tu proyecto
date: 2015-10-06T21:29:24+00:00
author: rtorralba
layout: post
guid: http://wordpress.artansoft.com/2015/10/06/easygrep-para-vim-busca-en-tu-proyecto/
permalink: /2015/10/easygrep-para-vim-busca-en-tu-proyecto/
tumblr_artansoft_permalink:
  - http://artansoft.tumblr.com/post/130640292588/easygrep-para-vim-busca-en-tu-proyecto
tumblr_artansoft_id:
  - "130640292588"
interface_sidebarlayout:
  - default
dsq_thread_id:
  - "4856143377"
categories:
  - vim
tags:
  - ide
format: gallery
---
[<img class="aligncenter wp-image-119 size-full" src="https://www.artansoft.com/wp-content/uploads/2015/10/vim_easygrep.gif" alt="Animación del plugun de vim easygrep" width="718" height="425" />](https://github.com/vim-scripts/EasyGrep)

Hoy casualmente he vuelto a usar este plugin de vim que te permite hacer búsquedas en todo el directorio en el que estés o recursivamente.

Nada que no haga ya el vim con comandos cómo el vimgrep, que son los que realmente usa, pero te facilita el uso de estos.

<!-- more -->

Por ejemplo, para buscar la palabra sobre la que tenemos debajo del cursor sólo tendremos que pulsar <leader>vv. Lo que con el vimgrep sería :vimgrep /palabra/gj ./*\*/\*.php (o la extensión que sea) y después :cw para ver el resultado de la búsqueda.

No soy partidario de reemplazar los comandos que por defecto usa el vim, pero este plugin lo veo realmente útil.
