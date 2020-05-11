---
id: 511
title: Taller de GIT. Uso de ramas. Que son las ramas y que utilidad tienen.
date: 2017-05-09T01:44:09+00:00
author: rtorralba
layout: page
guid: https://www.artansoft.com/?page_id=511
interface_sidebarlayout:
  - default
---
## Introducción.

Todas las operaciones que hemos comentado hasta ahora ya estaban ejecutándose en una rama, la rama principal que se crea por defecto cuando inicializamos un repositorio: **master**.

GIT nos permite crear otras ramas para poder desarrollar sin modificar la rama principal donde es conveniente mantener el código estable y probado.

Usos habituales de las ramas:

  * Arreglar errores.
  * Experimentar.
  * Funcionalidades grandes.
  * Etc&#8230;

Aunque el siguiente ejemplo no es la mejor manera de gestionar las ramas, nos servirá a entender como funcionan de una manera visual. En el siguiente capítulo veremos una manera más organizada de hacerlo.

<amp-img layout="responsive" class="alignnone wp-image-519" src="https://www.artansoft.com/wp-content/uploads/2017/05/ramas_con_merge_3_way.svg_-212x300.png" alt="Ejemplo de ramas con GIT" width="407" height="576" srcset="https://www.artansoft.com/wp-content/uploads/2017/05/ramas_con_merge_3_way.svg_-212x300.png 212w, https://www.artansoft.com/wp-content/uploads/2017/05/ramas_con_merge_3_way.svg_-724x1024.png 724w, https://www.artansoft.com/wp-content/uploads/2017/05/ramas_con_merge_3_way.svg_.png 744w" sizes="(max-width: 407px) 100vw, 407px"></amp-img>

## Comandos relativos a las ramas:

  * Crear: git branch rama
  * Movernos a una rama: git checkout rama
  * Crear una rama y movernos a ella: git checkout -b rama
  * Eliminar rama: git branch -d rama (No nos dejará borrar ramas sin fusionar)
  * Eliminar rama aunque no esté fusionada: git branch -D rama
  * Fusionar ramas (traernos los cambios de rama): git merge rama
  * Listar ramas: git branch
  * Listar ramas con último commit: git branch -v
  * Etc&#8230;
