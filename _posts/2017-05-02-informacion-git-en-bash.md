---
id: 461
title: Git en Bash. Muestra la información de GIT en el prompt de BASH
date: 2017-05-02T01:52:24+00:00
author: rtorralba
excerpt: |
  Os dejamos un pequeño truco muy sencillo pero bastante útil para que nos muestre la información de GIT en BASH, en concreto en que rama estamos y si hay alguna modificación en los ficheros en la misma.
  
  Está basado en ZSH, otro shell distinto a BASH que ofrece está funcionalidad. Si no quieres instalar un interprete de comando nuevo, pero si tener esta información, sólo deberás modificar el fichero .bashrc (recomendamos que hagáis una copia) de tu directorio de usuario, haciendo las siguiente modificaciones.
layout: post
guid: https://www.artansoft.com/?p=461
permalink: /2017/05/informacion-git-en-bash/
interface_sidebarlayout:
  - default
dsq_thread_id:
  - "5777857566"
image: /wp-content/uploads/2017/05/Git-logo.svg_.png
categories:
  - git
  - shell
---
Os dejamos un pequeño truco muy sencillo pero bastante útil para que nos muestre la información de <a href="https://git-scm.com/" target="_blank" rel="noopener noreferrer"><strong>GIT</strong></a> en <a href="https://es.wikipedia.org/wiki/Bash" target="_blank" rel="noopener noreferrer"><strong>BASH</strong></a>, en concreto en que rama estamos y si hay alguna modificación en los ficheros en la misma.

Está basado en <a href="http://www.zsh.org/" target="_blank" rel="noopener noreferrer"><strong>ZSH</strong></a>, otro shell distinto a **BASH** que ofrece está funcionalidad. Si no quieres instalar un interprete de comandos nuevo, pero si tener esta información, sólo deberéis modificar el fichero **.bashrc** (recomendamos que hagáis una copia) de vuestro directorio de usuario, haciendo las siguiente modificaciones.

## Instrucciones para mostrar la info de GIT en BASH

Añade estas dos funciones que nos extraerán la información de **GIT** del directorio actual y modifica la asignación del prompt:

<pre class="brush: bash; title: ; notranslate" title=""># Funciones
are_there_git_changes() {
    status=$(git status 2&gt; /dev/null)
    if [[ $status && ! $(echo $status | grep "clean") ]]; then
        echo "*"
    fi
}

parse_git_branch() {
    git branch 2&gt; /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ "$color_prompt" = yes ]; then
	# Original
	#PS1='${debian_chroot:+($debian_chroot)}\[&#92;&#48;33[01;32m\]\u@\h\[&#92;&#48;33[00m\]:\[&#92;&#48;33[01;34m\]\w\[&#92;&#48;33[00m\]\$ '

	# Línea modificada
	PS1='${debian_chroot:+($debian_chroot)}\[&#92;&#48;33[01;32m\]\u@\h\[&#92;&#48;33[00m\]:\[&#92;&#48;33[01;34m\]\w\[&#92;&#48;33[00m\]$(parse_git_branch)$(are_there_git_changes)\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
</pre>

Es muy útil al entrar en una carpeta saber que, hay un repositorio GIT inicializado, en que rama estás de este y si hay una modificación en al misma.

Ahora, cuando estéis en una consola dentro de una carpeta con un repositorio GIT inicializado, se mostrara la rama en y si hay cambios.

### En la rama master sin cambios

<pre class="brush: bash; title: ; notranslate" title="">user@machine:~/example_folder (master)$
</pre>

### En la rama master con cambios

<pre class="brush: bash; title: ; notranslate" title="">user@machine:~/example_folder (master)*$
</pre>

### En la rama feature/new-change sin cambios

<pre class="brush: bash; title: ; notranslate" title="">user@machine:~/example_folder (feature/new-change)$
</pre>
