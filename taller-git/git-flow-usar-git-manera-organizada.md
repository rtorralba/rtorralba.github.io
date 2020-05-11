---
id: 530
title: Taller de GIT. GIT flow. Cómo usar GIT de manera organizada en un proyecto y en un equipo de trabajo.
date: 2017-05-11T00:10:32+00:00
author: rtorralba
layout: page
guid: https://www.artansoft.com/?page_id=530
interface_sidebarlayout:
  - default
---
En el siguiente gráfico veremos cómo desarrollar creando ramas según el workflow git flow.

<amp-img layout="responsive" class=" wp-image-533 aligncenter" src="https://www.artansoft.com/wp-content/uploads/2017/05/git_flow-225x300.jpg" alt="GIT Flow" width="779" height="1039" srcset="https://www.artansoft.com/wp-content/uploads/2017/05/git_flow-225x300.jpg 225w, https://www.artansoft.com/wp-content/uploads/2017/05/git_flow.jpg 611w" sizes="(max-width: 779px) 100vw, 779px"></amp-img>

De la rama **develop** salen y se fusionan las ramas de las mejoras a implementar y las ramas de preparación de código a producción **release-***. Cuando hay un error en producción a corregir, crearemos una rama **hotfix-*** que saldrá y se fusionará en **master** para desplegar a producción y en **develop** para continuar desarrollando las nuevas funcionalidades sin bugs.

Extension para automatizar GIT flow. <a href="https://github.com/nvie/gitflow" target="_blank" rel="noopener noreferrer">https://github.com/nvie/gitflow</a>. Ofrece comandos para facilitar la creacion de features, hotfix, etc&#8230;

## Uso de tags

Git tiene la habilidad de etiquetar (tag) puntos específicos en la historia como importantes. Generalmente se usa esta funcionalidad para marcar puntos donde se ha lanzado alguna versión (E.g. v1.0).

> Git usa dos tipos principales de etiquetas: ligeras y anotadas. Una etiqueta ligera es muy parecida a una rama que no cambia —un puntero a una confirmación específica—. Sin embargo, las etiquetas anotadas son almacenadas como objetos completos en la base de datos de Git. Tienen suma de comprobación; contienen el nombre del etiquetador, correo electrónico y fecha; tienen mensaje de etiquetado; y pueden estar firmadas y verificadas con GNU Privacy Guard (GPG). Generalmente se recomienda crear etiquetas anotadas para disponer de toda esta información; pero si por alguna razón quieres una etiqueta temporal y no quieres almacenar el resto de información, también tiene disponibles las etiquetas ligeras. https://git-scm.com

Podemos usar los tags para **volver al estado** del respositorio que marcan y aunque no se pueden realizar cambios sobre un tag, si que puedes cambiar a ellos como si fuera una rama:

### Comandos

  * Listar tags: **git tag**
  * Crear tag: 
      * Ligera: **git tag v1.4**
      * Anotada: git **tag -a v1.4 -m &#8216;my version 1.4&#8217;**
  * Mostrar el estado del repositorio en un tag: **git show v1.4**
  * Enviar tags al repositorio remoto: **git push origin master &#8211;tag**
