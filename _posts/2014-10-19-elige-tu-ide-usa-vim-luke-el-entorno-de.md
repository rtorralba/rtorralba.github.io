---
id: 25
title: Elige tu IDE. ¡Usa VIM Luke!
date: 2014-10-19T09:35:01+00:00
author: rtorralba
layout: post
guid: http://wordpress.artansoft.com/2014/10/19/elige-tu-ide-usa-vim-luke-el-entorno-de/
permalink: /2014/10/elige-tu-ide-usa-vim-luke-el-entorno-de/
tumblr_artansoft_permalink:
  - http://artansoft.tumblr.com/post/125864702028/elige-tu-ide-usa-vim-luke-el-entorno-de
tumblr_artansoft_id:
  - "125864702028"
interface_sidebarlayout:
  - default
dsq_thread_id:
  - "4849070497"
rop_post_url_twitter:
  - 'https://www.artansoft.com/2014/10/elige-tu-ide-usa-vim-luke-el-entorno-de/?utm_source=ReviveOldPost&utm_medium=social&utm_campaign=ReviveOldPost'
categories:
  - vim
tags:
  - ide
  - plugin
  - programming
format: gallery
---
El entorno de desarrollo que utilicemos nos puede ayudar a programar de una manera más rápida y eficiente, cometer menos errores y trabajar de manera más cómoda.

Hay muchos y buenos IDES muy conocidos, Visual Studio, Eclipse, IntelliJ… Y es verdad que en algunos casos estamos casi obligados a usar uno por la tecnología que vayamos a desarrollar, android (android studio o eclipse), .NET (Visual Studio)… Pero en otros muchos, PHP, ruby, C, C++, python, go… Tenemos más libertad para elegir, ahí es donde entra nuestro protagonista, el rey de los editores, VI Improved, más conocido cómo VIM.

## ¿VIM cómo IDE?

Aunque muchos conoceréis el VIM cómo editor, ya que la rápida edición de textos es su mayor virtud, tal vez muchos no habiáis pensado que lo podéis usar cómo IDE, a continuación veremos que características solemos buscar en un entorno de desarrollo y cómo el VIM también nos lo puede ofrecer bien en su instalación base o a través de plugins.

**Árbol de proyecto. <a href="https://github.com/scrooloose/nerdtree" target="_blank">nerdtree</a>**.

Una de las cosas más usadas es el árbol de proyectos, este nos permite ver toda la jerarquía de directorios y que lugar ocupa el fichero que vamos a editar en este.

NerdTree nos ofrece esta funcionalidad, además nos permite guardar proyectos o bookmarks, editar el fichero en una nueva pestaña, realizar operaciones básicas en el sistema de ficheros (mover, crear, eliminar…).

La visualización es cómoda por que se muestra en una ventana vertical que puedes mostrar u ocultar cuando quieras.

Además si quieres que el estado en el que estás se mantenga en todas las pestañas cómo lo haría cualquier IDE puedes usar el plugin <a href="https://github.com/jistr/vim-nerdtree-tabs" target="_blank">vim-nerdtree-tabs</a>.

**Corrección sintáctica.** 

<a href="https://github.com/scrooloose/syntastic" target="_blank">Syntastic</a>.

Con este plugin VIM os avisará de cualquier error sintáctico que hayáis cometido al guardar el fichero.

Autocompletado de código.Esta és una función que viene de casa en el VIM que le permite autocompletar nombres de funciones conocidas en el lenguaje en el que estemos pulsando las teclas Ctrl+X Ctrl+O mostrándonos incluso la definición de la función para saber que parámetros acepta. Para autocompletar siempre usaremos primero Ctrl+X y Ctrl+O viene de Omnicompletion. Otro ejemplo es el autocompletado de lineas enteras que encuentre en cualquiera de los buffers abiertos, Ctrl+X Ctrl+L (Line).

**Autocompletado de comillas, parentesis, llaves…** 

<a href="https://github.com/Raimondi/delimitMate" target="_blank">DelimitMate</a>.

Otra ventaja que solemos encontrar es que cuando escribimos algún carácter que implique abierto y cerrado, se suele autocompletar este último y situar el cursor dentro de los dos caracteres para editar en anterior, por ejemplo en un string en PHP, escribimos comilla simple **‘ **y el editor este plugin automáticamente nos escribe la de cierre y situa el cursor entre las dos, **’|’**.

**¡Más autocompletado!** 

<a href="https://github.com/garbas/vim-snipmate" target="_blank">SnipMate</a>.

Posiblemente alguno de vosotros conoceréis el editor TextMate de Mac OS. Pues este plugin nos ofrece una funcionalidad parecida, que para los que no la conozcan paso a explicar a continuación. Los snippets son partes de código que solemos repetir y que algunos editores cómo el TextMate tienen memorizados para que cuando escribamos la clave del snippet nos complete todo el código.

Por ejemplo, si en un fichero html escribimos la palabra form y pulsamos el tabulador, automáticamente el vim nos rellenara toda la estructura básica de un form con un input y el submit. A continuación os dejo un video para que veáis su funcionamiento en movimiento.

**Trabajar con GIT**

Para trabajar con el repositorio de código GIT vim tiene varios plugins.

  * Gitgutter nos muestra una línea a la izquierda del fichero donde nos marcará con el signo + las lineas nuevas, con &#8211; las eliminadas y con ~ las modificadas.

  * <a href="https://github.com/tpope/vim-fugitive" target="_blank">Fugitive</a>, puedes ejecutar cualquier comando de GIT en modo normal escribiendo :Git y el comando, por ejemplo, :Git comit -am “este es el cometario del commit”.
  * <a href="https://github.com/pthrasher/conqueterm-vim" target="_blank">Conqueterm</a>, abre una consola dentro de vim con lo que podemos ejecutar cualquier comando, incluidos los de GIT.

## Conclusión

Bueno, con esto os he dejado unos cuantos trucos para usar el VIM para desarrollar cómo IDE, más adelante iremos desvelando otros para que no se haga un post demasiado largo (Si no lo es ya).

Por último os preguntaréis, ¿porqué complicarnos la vida con todo esto habiendo ya IDEs que no requieren esta configuración?:

  * Si sabéis editar en VIM o cuando aprendáis, no hay ningún editor más rápido que este.
  * Es multiplataforma, y es más, se puede ejecutar por consola, si alguien sabe un IDE con el que pueda editar por SSH cómo si estuviera en la misma máquina, que no dude en aportarlo.
  * Ligero, seguro que algunos habréis tenido que lidiar con que el eclipse o cualquier otro IDE necesita no e cuantos MB dce RAM o tarda un siglo en abrirse, ¡en vim puedes estar editando tranquilamente 10 ficheros ocupando tan sólo 50 MB de RAM!
  * Para editar usa para casi todas las acciones el teclado, con lo que nuestra muñeca agradecerá usar menos el ratón y ganaremos en velocidad.
