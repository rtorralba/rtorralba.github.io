---
id: 540
title: Taller GIT. Práctica.
date: 2017-05-11T01:56:13+00:00
author: rtorralba
layout: page
guid: https://www.artansoft.com/?page_id=540
interface_sidebarlayout:
  - default
---
## Trabajar con un proyecto HTML y un repositorio local.

  1. Crear una carpeta practica-taller-git en un pc.
  2. Inicializa el repositorio. **git init**
  3. Crea el fichero index.html con un html simple.
  4. Comprueba que el repositorio a detectado el cambio. **git status**
  5. Añade el fichero al stage. **git add index.html.**
  6. Confirma los cambios. **git commit -m &#8220;added index file&#8221;**
  7. Añade un fichero description.html y edita index.html.
  8. Comprueba que ha detectado el nuevo fichero y la modificación de index. 
      1. **git status**
      2. **git diff**
  9. Crea un fichero TODO.txt de tareas pendientes.
 10. Comprueba que git ha detectado el nuevo fichero. **git status.**
 11. Ignora el fichero TODO.txt ya que es donde anotaremos nuestras tareas personales y no debe formar parte del proyecto. Para ello crea un fichero **.gitignore** con la linea TODO.txt.
 12. Comprueba que ya no detecta el nuevo fichero TODO.txt (si que detectara el .gitignore claro). **git status**
 13. Añade y confirma el .gitignore.
 14. Puedes continuar añadiendo ficheros html, css e imágenes para probar el repositorio.

## Haz un fork del repositorio creado para la práctica del taller:

  1. Entra en <a href="https://github.com/" target="_blank" rel="noopener noreferrer">https://github.com/</a>
  2. Accede a tu cuenta, si todavía no la tienes createla.
  3. Accede al repositorio <a href="https://github.com/rtorralba/taller-git/" target="_blank" rel="noopener noreferrer">https://github.com/rtorralba/taller-git/</a>
  4. Pulsa el botón **fork** (parte superior derecha) para crearte una copia del mismo en tu cuenta.
  5. Clona el repositorio en tu equipo. **git clone https://github.com/[tu-nombre-de-usuario]/taller-git.git**
  6. Crea un nuevo fichero en el proyecto que se llame [tu-nombre-de-usuario].html
  7. Edita el fichero añadiendo como título tu nombre, algún texto y lo que desees en el.
  8. Añade el fichero al repositorio.
  9. Súbelo al repositorio remoto (github). **git push**
 10. Crea una rama develop y cámbiate a ella.
 11. Realiza cambios en el proyecto, confírmalos y súbelos al repositorio remoto.
 12. Fusiona la rama develop con en master y sube los cambios al repositorio remoto.
 13. Haz nuevos cambios en el proyecto siguiendo el flujo de trabajo **git flow**.