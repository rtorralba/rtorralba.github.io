---
id: 523
title: Taller GIT. Resolviendo conflictos
date: 2017-05-10T23:38:53+00:00
author: rtorralba
layout: page
guid: https://www.artansoft.com/?page_id=523
interface_sidebarlayout:
  - default
---
## ¡¡¡No entres en pánico!!!

Algunas veces al fusionar dos ramas no resulta tan bien, sino que hay un conflicto, esto cuando los commits de la rama a fusionar y la rama actual modifican la misma la misma línea en un archivo y git no puede decidir cuál versión elegir, y te avisa que tu debes resolverlo.

Cuando sucede esto GIT nos mostrará algo similar a lo siguiente en la consola de comandos:

<pre class="brush: bash; title: ; notranslate" title="">Automezclado index.html
CONFLICTO(contenido): conflicto de fusión en index.html
Automatic merge failed; fix conflicts and then commit the result.
</pre>

Cómo dice el título: **¡¡¡No entres en pánico!!!**

Realmente, lo único que ha pasado es que en las dos ramas se ha/n modificado el mismo archivo/s en la misma línea. Sólo tendremos que abrirlo/s y decidir con que nos quedamos:

<pre class="brush: xml; title: ; notranslate" title="">&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
    &lt;meta charset="UTF-8"&gt;
    &lt;title&gt;&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;&lt;&lt;&lt;&lt;&lt;&lt; HEAD
    


&lt;h1&gt;Hola que tal el taller de GIT?&lt;/h1&gt;



=======
    


&lt;h1&gt;Hola que tal el taller?&lt;/h1&gt;



&gt;&gt;&gt;&gt;&gt;&gt;&gt; develop
&lt;/body&gt;
&lt;/html&gt;
</pre>

Lo que está en la rama actual esta entre <<<<<<< HEAD y ======= y en la parte del código de la rama que estamos intentando fusionar entre ======= y >>>>>>>.

Por ejemplo nos podemos quedar con los de la rama actual que es lo que realmente queremos porque está completo. Entonces:

  * Borramos las lineas que no queremos quedarnos.
  * Las separadoras.
  * Guardamos.
  * Añadimos al **stage**.
  * Hacemos **commit**.

Después de guardarlo haremos los siguiente:

<pre class="brush: bash; title: ; notranslate" title="">git status

En la rama master
Tiene rutas sin fusionar.
  (solucione los conflictos y ejecute «git commit»)
  (use "git merge --abort" to abort the merge)

Rutas no combinadas:
  (use «git add &lt;archivo&gt;...» para marcar resolución)

	modificado por ambos:   index.html

no hay cambios agregados al commit (use «git add» o «git commit -a»)

git add index.html

git commit (Ya nos da un mensaje predeterminado)

Merge branch 'develop'

# Conflicts:
#	index.html
#
# It looks like you may be committing a merge.
# If this is not correct, please remove the file
#	.git/MERGE_HEAD
# and try again.
                      
[master 86e032c] Merge branch 'develop' (Al guardar nos mostrará este mensaje confirmando el commit
</pre>

Los conflictos pueden suceder en varios archivos y varias líneas, sólo tendremos ir resolviéndolos uno a uno.

Recuerda que tener el código actualizado antes de empezar a modificarlo nos ayudara a tener menos conflictos, con lo cual es recomendable hacer **git pull** antes de empezar a tocarlo.

Los IDEs y herramientas para GIT nos facilitan la tarea de resolución de conflictos mostrándolos de una manera más visual. En la siguiente imagen vemos como se muestra la resolución de conflictos en la herramienta integrada de PHPStorm.

<img class=" wp-image-527 aligncenter" src="https://www.artansoft.com/wp-content/uploads/2017/05/merge-files-300x162.png" alt="Merge con PHPStorm" width="771" height="416" srcset="https://www.artansoft.com/wp-content/uploads/2017/05/merge-files-300x162.png 300w, https://www.artansoft.com/wp-content/uploads/2017/05/merge-files-768x415.png 768w, https://www.artansoft.com/wp-content/uploads/2017/05/merge-files-1024x554.png 1024w, https://www.artansoft.com/wp-content/uploads/2017/05/merge-files.png 1039w" sizes="(max-width: 771px) 100vw, 771px" />

## Quedándonos con los cambios de la rama actual o con los de la que se va a fusionar.

En ocasiones sabemos de antemano en que rama está la versión del código. En ese caso tenemos comando que nos permite quedarnos con los cambios de esta rama:

**git checkout &#8211;ours .**

o con los de la rama a fusionar:

**git checkout &#8211;theirs .**