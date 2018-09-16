---
id: 380
title: Base de datos. Diseño con MySQL Workbench
date: 2017-02-27T02:17:37+00:00
author: rtorralba
excerpt: |
  A la hora de diseñar una base de datos relacional, es bueno contar con una herramienta visual que nos permita ver de un golpe de vista en el diagrama entidad relación mejorado (EER) todas las tablas y las relaciones entre ellas.
  
  Por otra parte, una parte importante a la hora de hacer cualquier tipo de desarrollo es no hacer el trabajo varias veces (DRY), para ello deberemos realizar el diseño de la base de datos sólo una vez y que después se replique a todos aquellos sitios donde se haga use de el mismo.
layout: post
guid: https://www.artansoft.com/?p=380
permalink: /2017/02/diseno-base-de-datos-mysql-workbench/
interface_sidebarlayout:
  - default
dsq_thread_id:
  - "5717852998"
rop_post_url_twitter:
  - 'https://www.artansoft.com/2017/02/diseno-base-de-datos-mysql-workbench/?utm_source=ReviveOldPost&utm_medium=social&utm_campaign=ReviveOldPost'
image: /wp-content/uploads/2017/02/influenza-testing-laboratory-showed-a-laboratorian-entering-data-into-an-influenza-specific-database.jpg
categories:
  - bases-de-datos
  - php
  - web
tags:
  - herramientas
  - laravel
  - mysql
  - php
---
## Diseño de base de datos. Introducción.

Para comenzar, a la hora de diseñar una base de datos relacional, es bueno contar con una herramienta visual que nos permita ver de un golpe de vista en el diagrama **entidad relación mejorado (EER)** todas las tablas y las relaciones entre ellas.

Además, una parte importante a la hora de hacer cualquier tipo de desarrollo es no hacer el trabajo varias veces (<a href="https://es.wikipedia.org/wiki/No_te_repitas" target="_blank" rel="noopener">DRY</a>), para ello deberemos realizar el diseño de la base de datos sólo una vez y que después se replique a todos aquellos sitios donde se haga use de el mismo.

## MySQL Workbench.

MySQL Workbench es una herramienta oficial de MySQL para gestionar bases de datos. Aunque algunas veces se queda colgada o se cierra inesperadamente, suele guardar nuestro trabajo y es muy útil para la finalidad anteriormente descrita y ademas incluye una editor de modelos en el podremos diseñar nuestros diagramas EER.

### Sincronización del modelo con la base de datos.

Esta utilidad de la herramienta nos permitirá ganar mucho tiempo y es que podremos sincronizar los cambios que hayamos realizado en el modelo con la base de datos y viceversa.

En la opción de menú database encontraremos la opción **Synchronize model** en la que nos lanzará un asistente donde, tras elegir el destino a sincronizar, nos mostrará los cambios encontrados dejándonos elegir cuales aplicar y su respectivo SQL.

### **Generación de migrations de Laravel.**

Por último, para los que trabajáis con el framework PHP Laravel, tenéis disponible un <a href="https://laravel-news.com/export-from-mysql-workbench-to-a-laravel-migration" target="_blank" rel="noopener">plugin</a> para MySQL Workbench que os permitirá generar las migrations de las tablas automáticamente.

<a href="https://laravel-news.com/export-from-mysql-workbench-to-a-laravel-migration" target="_blank" rel="noopener">https://laravel-news.com/export-from-mysql-workbench-to-a-laravel-migration</a>

## Conclusión.

Esta herramienta nos permitirá hacer el diseño de una manera visual y trasladarlo a MySQL y a Laravel.

Además, Es aconsejable hacer todos los cambios del diseño de la base de datos en las fases iniciales desde el editor de modelos.

Finalmente, en fases más avanzadas del proyecto, realizaremos los cambios con las migrations para tener un historial en el repositorio de código, y que los desarrolladores puedan aplicarlos de una manera sencilla.
