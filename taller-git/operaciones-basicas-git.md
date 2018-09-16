---
id: 495
title: Taller de GIT. Empezando. Operaciones básicas en GIT
date: 2017-05-07T04:19:38+00:00
author: rtorralba
layout: page
guid: https://www.artansoft.com/?page_id=495
interface_sidebarlayout:
  - default
---
## Configuración

Aunque podríamos editar directamente el fichero ~/.gitconfig (Dependiendo del sistema operativo), los siguientes comandos nos facilitarán la configuración.

**Identidad**

<pre class="brush: bash; title: ; notranslate" title="">git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
</pre>

**Editor**

<pre class="brush: bash; title: ; notranslate" title="">git config --global core.editor vim
</pre>

**Herramienta de diferencias**

<pre class="brush: bash; title: ; notranslate" title="">git config --global merge.tool vimdiff
</pre>

## Comandos básicos

&nbsp;

**git clone** (Sólo una vez)

El primer paso es traernos el repositorio a nuestro equipo con **git clone**. Este comando sólo se ejecuta una vez, una vez ya tengamos el repositorio en nuestro equipo ya no será necesario ejecutarlo más, sólo tendremos que ejecutar el siguiente comando, **git pull**, para descargarnos los cambios del repositorio remoto con el nuestro.

**git pull**

Recibir los cambios del repositorio remoto. Es conveniente ejecutar este comando andes de realizar ningún cambio en el código para evitar conflictos.

**git status**

Ver el estado del repositorio, que ficheros se han añadido, eliminado o modificado.

**git add**

Añadir los ficheros que hayan sufrido algún cambio (nuevos, modificados o eliminados) a la fase de preparación o **stage**.

**git commit**

Este comando es para confirmar los cambios. Para ello deberemos especificar un mensaje que resuma los cambios que hayamos hecho en los ficheros. Si ejecutamos el comando con la opción **-m**, podremos especificar el mensaje directamente como tercer parámetro, sino, abrirá el editor que hayamos configurado para redactarlo.

**git push**

Subir los cambios al repositorio remoto. Debemos especificar a que servidor remoto y que en rama queremos subilos. **git push origin master**. Con el parámetro -u, indicaremos que ese es el server y la rama por defecto si no los especificamos. **git push -u origin master**.

<pre class="brush: bash; title: ; notranslate" title="">git clone git://github.com/user/project.git
touch README
touch main.c
touch help.txt
git status
# On branch master
# Untracked files:
#   (use "git add &amp;lt;file&amp;gt;..." to include in what will be committed)
#
#   README
nothing added to commit but untracked files present (use "git add" to track)
git add *.c
git add README
git add .
git commit –m 'Added README, c and files'
git push -u origin master
</pre>

## ¿Que pasa si tenemos nuestro código en local y queremos crear un repositorio?

Si tenemos un proyecto en local y queremos controlar los cambios con el repositorio sólo tendremos que ejecutar el comando **git init. **Al ejecutar este comando, para nuestro repositorio todos los ficheros serán nuevos, tendremos que añadirlos y confirmar los cambios:

<pre class="brush: bash; title: ; notranslate" title="">git init
git add .
git commit -m "initial commit"
</pre>

## Como centralizar el código para compartirlo

¿Que pasa si tenemos nuestro repositorio en local y queremos centralizarlo en nuestro propio servidor?

**En el servidor**

<pre class="brush: bash; title: ; notranslate" title="">mkdir project.git
cd project.git
git init --bare
</pre>

**En nuestra carpeta**

<pre class="brush: bash; title: ; notranslate" title="">git remote add origin user@server:/path/to/the/project.git
git push -u origin master
</pre>