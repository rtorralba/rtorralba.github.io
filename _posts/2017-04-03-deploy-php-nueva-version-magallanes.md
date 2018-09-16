---
id: 421
title: Deploy PHP con la nueva versión de Magallanes
date: 2017-04-03T01:43:00+00:00
author: rtorralba
excerpt: Hace un tiempo ya hablamos sobre esta herramienta de deploy PHP. Ahora nos sorprende gratamente con una nueva versión reescrita usando componentes Symfony 3 y usando Monolog para los logs.
layout: post
guid: https://www.artansoft.com/?p=421
permalink: /2017/04/deploy-php-nueva-version-magallanes/
interface_sidebarlayout:
  - default
related_posts:
  - 'a:2:{i:0;i:5;i:1;i:259;}'
dsq_thread_id:
  - "5714625078"
image: /wp-content/uploads/2016/05/server-1235959_960_720.jpg
categories:
  - buenas-practicas
  - php
  - web
---
## Herramienta ya conocida para deploy PHP

Hace un tiempo [ya hablamos](/2015/12/magallanes-herramienta-deploy-php/) sobre esta herramienta de deploy PHP. Ahora nos sorprende gratamente con una nueva versión reescrita usando componentes <a href="http://symfony.com" target="_blank">Symfony 3</a> y usando <a href="https://github.com/Seldaek/monolog" target="_blank">Monolog</a> para los logs.

## Mejoras

Aunque la anterior versión ya usaba el formato <a href="https://es.wikipedia.org/wiki/YAML" target="_blank">YAML</a> para la configuración de los despliegues, formato más legible que otros como json, en esta versión ha unificado toda la configuración en un solo fichero de todos los entornos:

```yaml
magephp:
	environments:
		production:
			user: app
			branch: master
			host_path: /var/www/myapp
			releases: 4
			exclude:
				- ./var/cache/*
				- ./var/log/*
				- ./web/app_dev.php
			hosts:
				- webserver1
				- webserver2
				- webserver3
			pre-deploy:
				- git/update
				- composer/install
				- composer/dump-autoload
			on-deploy:
				- symfony/cache-warmup: { env: 'dev' }
				- symfony/assets-install: { env: 'dev' }
				- symfony/assetic-dump: { env: 'dev' }
			on-release:
			post-release:
			post-deploy:
```

Por otra parte, el usar paquetes de un framework con una comunidad tan grande detrás como Symfony, puede hacer que crezca conjuntamante recibiendo las mejoras que vayan recibiento estos paquetes, y simplifica el mantenimiento de lo que es estictamente Magallanes.

## Magallanes, Ansistrano, Deployer&#8230; ¿Que sistema uso?

Todos estos sistemas son buenos y contienen las características básicas que debemos buscar en cualquier sistema de despliegue:

  * Multi host
  * Ejecución de comandos
  * Distintas etapas para la ejecución comandos (Pre-deploy, on-deploy&#8230;)
  * Poder guardar distintas releases
  * Opción de mantener carpertas y ficheros compartidos entre releases
  * Posibilidad de rollback
  * Distintas estrategias de deploy (rsync, git, tar&#8230;)&#8230;

Lo bueno de usar sistemas como magallanes o deployer, es que la dependencia de este estos sistemas viene en el fichero composer.json, con lo que, para que cualquier desarrollador pueda desplegar, sólo tendrá que ejecutar composer install, que además tiene que hacer de todas formas para instalar las demás dependencias del proyecto.

Para usar ansistrano, el desarrollador deberá instalar aplicaciones adicionales, por otra parte, se basa sobre el estandar ansible, con todo lo que eso conlleva y tiene una comunidad que va creciendo cada vez más detrás.
