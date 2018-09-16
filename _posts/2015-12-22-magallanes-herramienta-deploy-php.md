---
id: 5
title: Magallanes. Herramienta para deploy en PHP
date: 2015-12-22T01:12:25+00:00
author: rtorralba
excerpt: Magallanes es una herramienta deploy de tu proyectos a tu/s servidor/es muy sencilla de usar que te dará funcionalidades interesantes y te permitirá llevar un control de los despliegues que vayas haciendo.
layout: post
guid: http://wordpress.artansoft.com/2015/12/22/magallanes-herramienta-para-deploy-en-php/
permalink: /2015/12/magallanes-herramienta-deploy-php/
tumblr_artansoft_permalink:
  - http://artansoft.tumblr.com/post/135676320923/magallanes-herramienta-para-deploy-en-php
tumblr_artansoft_id:
  - "135676320923"
interface_sidebarlayout:
  - default
hefo_before:
  - "0"
hefo_after:
  - "0"
dsq_thread_id:
  - "4850293648"
image: /wp-content/uploads/2015/12/deploy_optimizada.png
categories:
  - php
  - web
tags:
  - deployment
  - developer-tools
  - php
---
<a href="http://magephp.com/" target="_blank">Magallanes</a><a href="http://magephp.com/" target="_blank"><img class="alignright wp-image-197 size-full" src="https://www.artansoft.com/wp-content/uploads/2015/12/magallanes-logo.png" alt="Logotipo de la herramienta de deploy Magallanes" width="160" height="160" srcset="https://www.artansoft.com/wp-content/uploads/2015/12/magallanes-logo.png 160w, https://www.artansoft.com/wp-content/uploads/2015/12/magallanes-logo-150x150.png 150w, https://www.artansoft.com/wp-content/uploads/2015/12/magallanes-logo-100x100.png 100w" sizes="(max-width: 160px) 100vw, 160px" /></a> es una herramienta deploy de tu proyectos a tu/s servidor/es muy sencilla de usar que te dará funcionalidades interesantes y te permitirá llevar un control de los despliegues que vayas haciendo.

## Funcionalidades

  * Multi entorno
  * Distintas estrategias de deploy
  * Multi host
  * Releases
  * Tareas

<!-- more -->

## Multi entorno

Puedes deifinir configuraciones para distintos entornos para poder desplegar en cada uno de ellos, desarrollo, preproducción, producción…

`mage deploy to:production`

## Distintas estrategias de deploy

Puedes definir que estrategia seguirá el deploy para subir los archivos al servidor:
  
* rsync
  
* targz
  
* git-rebase
  
* disabled

## Multi host

Puedes desplegar tus archivos simultaneamente en varios servidores, esta funcionalidad es muy util para sistemas de servidores web balanceados. Defines todos los hosts en los que quieres desplegar e incluso puedes configurar distintas configuraciones por host.

`hosts:<br />
- 172.16.0.101<br />
- 172.16.0.102<br />
- 172.16.0.201:2222`

## Relases

Esta es una de las funcionalidades más interesantes, se puede desplegar los proyectos manteniendo cierto número de releases que nos permitiran deshacer el despliegue (rollback) si detectamos que alguno de nuestros deploys han ocasionado algún problema en producción.

`releases:<br />
enabled: true<br />
max: 10<br />
symlink: current<br />
directory: releases`

`mage releases rollback --release=20120101172148 to:production`

`mage releases rollback --release=-1 to:production`

## Tareas

Habitualmente en los procesos de deploy se suelen tener que realizar tareas cómo, cambiar permisos de archivos o carpetas, borrar caches…

Con magallanes podrás usar una serie de tareas e incluso definirte la tuyas propias y ejecutarlas antes, durante y después del despliegue o después del release.
