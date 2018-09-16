---
id: 554
title: VIM con ctags. Autogenerar etiquetas en sin bloquear el editor
date: 2017-07-09T23:44:10+00:00
author: rtorralba
excerpt: |
  Como muchos sabréis. una de las maneras autocompletar código, saltar a la definición... Es usando vim con ctags, una aplicación que genera un archivo de etiquetas para guardar todas las definiciones dentro de tu código.
  
  Esto implica que deberíamos actualizar las etiquetas cada vez que generemos el código. Esto lo podemos solventar de manera sencilla configurando en nuestro .vimrc que ejecute el comando cada vez que guardemos el buffer pero... Para proyectos con muchos archivos, como los que están basados en frameworks php como symfony o laravel, lleva un tiempo parsear todos lo ficheros, con lo que el vim se quedará un rato en espera cuando guardemos.
  
  Podemos solucionar esto gracias a que a partir de la versión 8 de vim podemos ejecutar tareas de manera asíncrona.
layout: post
guid: https://www.artansoft.com/?p=554
permalink: /2017/07/vim-ctags-autogenerar-etiquetas/
interface_sidebarlayout:
  - default
related_posts:
  - 'a:2:{i:0;i:33;i:1;i:8;}'
dsq_thread_id:
  - "5976592714"
image: /wp-content/uploads/2017/07/php_codecompletion.jpg
categories:
  - php
  - vim
---
## VIM con ctags

Como muchos sabréis. una de las maneras autocompletar código, saltar a la definición&#8230; Es usando vim con <a href="https://en.wikipedia.org/wiki/Ctags" target="_blank" rel="noopener">ctags</a>, una aplicación que genera un archivo de etiquetas para guardar todas las definiciones dentro de tu código.

Esto implica que deberíamos actualizar las etiquetas cada vez que generemos el código. Esto lo podemos solventar de manera sencilla configurando en nuestro .vimrc que ejecute el comando cada vez que guardemos el buffer pero&#8230; Para proyectos con muchos archivos, como los que están basados en frameworks php como symfony o laravel, lleva un tiempo parsear todos lo ficheros, con lo que el vim se quedará un rato en espera cuando guardemos.

Podemos solucionar esto gracias a que a partir de la versión 8 de vim podemos ejecutar tareas de manera asíncrona.

## Generación de ctags de manera asíncrona

A continuación os dejo un ejemplo de función para generar las etiquetas en background, comprobando primero que tenemos una versión de vim superior a la 8 y que la tarea no está ya ejecutándose, y su función de callback para mostrar que la generación de etiquetas a finalizado.

<pre class="brush: bash; title: ; notranslate" title="">function! GenerateTagsCallback(channel)
	unlet g:generateTagsOutput
	echo 'Tags generated!'
endfunction

function! GenerateTags()
	if v:version &lt; 800
		echoerr 'Requires VIM version 8 or higher'
		return
	endif

	if exists('g:generateTagsOutput')
		echo 'Already running task in background'
	else
		execute "silent !rm -f .git/tags"
		let g:generateTagsOutput = tempname()
		let command = printf('ctags --options=%s/dotfiles/vim/ctags.cnf', $HOME)
		call job_start(command, {'close_cb': 'GenerateTagsCallback', 'out_io': 'file', 'out_name':g:generateTagsOutput})
	endif
endfunction
</pre>

Os dejo también la configuración de ctags que uso para quenerar las etiquetas en PHP. Como podréis ver guardo el fichero de tags dentro de la carpeta .git para se excluya del repositorio.

<pre class="brush: bash; title: ; notranslate" title="">-f .git/tags
--recurse
--fields=afikmsS
--languages=php
--exclude=.git
--tag-relative=yes
</pre>

## Exuberant ctags vs Universal ctags

Indagando en la generación de tags, descubrí que el proyecto <a href="http://ctags.sourceforge.net/" target="_blank" rel="noopener">exuberant ctags</a>, que ya actualizaba al original ctags, ha dejado de ser mantenido desde 2009 por lo que no añade los cambios de sintaxis que se han ido produciendo desde entonces, como los introducidos en PHP 7. Por suerte <a href="https://ctags.io/" target="_blank" rel="noopener">universal ctags</a> continua y mantiene las sintaxis de manera activa.

Os dejo como sustituir exuberant ctags por universal ctags en ubuntu.

<pre class="brush: bash; title: ; notranslate" title="">sudo apt-get remove exuberant-ctags
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh 
./configure
make
sudo make install
</pre>

Podéis consultar mi configuración completa de vim en github:

<a href="https://github.com/rtorralba/dotfiles" target="_blank" rel="noopener">https://github.com/rtorralba/dotfiles</a>
