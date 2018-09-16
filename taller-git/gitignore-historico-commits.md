---
id: 506
title: Taller de GIT. .gitignore e histórico de commits
date: 2017-05-07T23:52:15+00:00
author: rtorralba
layout: page
guid: https://www.artansoft.com/?page_id=506
interface_sidebarlayout:
  - default
dsq_thread_id:
  - ""
---
## Como hacer que el repositorio ignore algunos ficheros o carpetas

En ocasiones no es conveniente que ciertos archivos o carpetas estén en nuestro repositorio:

  * Ficheros de configuración de entorno (Producción, preproducción, desarrollo&#8230;)
  * Ficheros con datos sensibles (Contraseñas de conexión a base de datos&#8230;)
  * Ficheros temporales (\*.swp, \*.swo, ~*, .tmp&#8230;)
  * Configuración de editores (.idea, .project, .classpeth&#8230;)
  * Archivos generados en tiempo de ejecución (upload/ user-images/&#8230;)
  * Archivos compilados/ejecutables&#8230;

Podemos ignorar este tipo de archivos mediante el fichero .gitignore, en este podemos especificar archivos y carpetas con rutas absolutas, relativas, con comodines&#8230;

Para cada tipo de proyecto (PHP, Java, Android&#8230;), suele tener un .gitignore muy parecido ya que se suelen ignorar los mismos archivos. Existen varios servicios que nos ofrecen estos archivos para facilitarnos el trabajo:

  * <a href="https://www.gitignore.io/" target="_blank" rel="noopener noreferrer">https://www.gitignore.io/</a>
  * <a href="https://github.com/github/gitignore" target="_blank" rel="noopener noreferrer">https://github.com/github/gitignore</a>

## Recursivo

La especificación del .gitignore es recursiva. Podemos definir unos ficheros a ignorar en la raíz del proyecto pero especificar otros en una carpeta interior añadiendo otro .gitignore en la misma.

## ¿Que pasa si hemos añadido ficheros al repositorio que realmente no deberían estarlo?

En ocasiones podemos añadir todos los archivos al repositorio y después darnos cuenta que algunos no deberían estarlo. Podemos arreglarlo con el siguiente comando:

<pre class="brush: bash; title: ; notranslate" title="">git rm --cached .idea
</pre>

el git rm sin el &#8211;cached eliminaría el archivo del disco también, con esta opción, simplemente lo quita del repositorio, deja de monitorizar sus cambios.

En el siguiente enlace podréis encontrar más información sobre el .gitignore:

<a href="https://git-scm.com/book/es/v1/Fundamentos-de-Git-Guardando-cambios-en-el-repositorio" target="_blank" rel="noopener noreferrer">https://git-scm.com/book/es/v1/Fundamentos-de-Git-Guardando-cambios-en-el-repositorio</a>

## Histórico de commits o confirmaciones

Para ver el histórico de commits tenemos el comando **git log**, no obstante, en este caso las herramientas e IDEs disponibles, nos ayudaran más en este caso mostrandonos más información y de una manera más legible:

<pre class="brush: bash; title: ; notranslate" title="">git log
</pre>

Ejemplo:

<pre class="brush: bash; title: ; notranslate" title="">$ git log
commit ca82a6dff817ec66f44342007202690a93763949
Author: Scott Chacon &lt;schacon@gee-mail.com&gt;
Date:   Mon Mar 17 21:52:11 2008 -0700

    changed the version number

commit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7
Author: Scott Chacon &lt;schacon@gee-mail.com&gt;
Date:   Sat Mar 15 16:40:33 2008 -0700

    removed unnecessary test code

commit a11bef06a3f659402fe7563abf99ad00de2209e6
Author: Scott Chacon &lt;schacon@gee-mail.com&gt;
Date:   Sat Mar 15 10:31:28 2008 -0700

    first commit
</pre>