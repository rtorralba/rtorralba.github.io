---
id: 593
title: Laravel Mix con node_modules en symlink
date: 2017-11-01T13:26:02+00:00
author: rtorralba
excerpt: |
  Esta semana para agilizar el deploy de un proyecto con ansistrano, hemos decidido mover las carpetas vendor y node_modules a la carpeta shared para compartirla entre releases y no tener que instalar todos los paquetes PHP y javascript cada deploy.
  
  Al hacerlo la ejecución de npm (npm run prod) no ejecutaba las tareas en el fichero webpack.mix.js donde están las tareas de Laravel Mix a ejecutar.
layout: post
guid: https://www.artansoft.com/?p=593
permalink: /2017/11/laravel-mix-con-node-modules-en-symlink/
interface_sidebarlayout:
  - default
related_posts:
  - 'a:1:{i:0;i:259;}'
dsq_thread_id:
  - "6255857134"
image: /wp-content/uploads/2017/11/laravel-2.jpg
categories:
  - php
  - web
tags:
  - ansistrano
  - laravel
  - laravel-mix
  - npm
  - webpack
---
## Deploy de proyecto Laravel y Mix con Ansistrano

Esta semana para agilizar el deploy de un proyecto Laravel con [ansistrano](https://www.artansoft.com/2016/05/deploy-de-proyectos-php-ansistrano/), hemos decidido mover las carpetas vendor y node_modules a la carpeta shared para compartirla entre releases y no tener que instalar todos los paquetes PHP y javascript cada deploy.

Al hacerlo la ejecucion de npm, npm run prod, no ejecutaba las tareas en el fichero webpack.mix.js donde están las tareas de Laravel Mix a ejecutar.

## Solución

Buscando información encontramos algunos posts en Laracasts y cogiendo algunas ideas dimos con la solución.

El problema es simplemente que con un enlace simbólico Laravel Mix no encuentra el fichero de configuración de tareas (webpack.mix.js). Podemos solucionarlo con estos pequeños cambios:

### Crear fichero webpack.config.js

Primero creamos un fichero webpack.config.js en la raiz del proyecto. En este asignaremos el directorio de trabajo de webpack y después cargaremos el fichero de configuración habitual. Este se encuentra dentro de la carpeta laravel-mix en vendor.

```javascript
let Mix = require('laravel-mix').config;
Mix.Paths.setRootPath(path.resolve(__dirname));

module.exports = require('laravel-mix/setup/webpack.config.js');
```

### Cargar el fichero creado en la tarea de producción

Después modificaremos la linea del script de producción en el fichero **package.json** para que coja la configuración del fichero que acabamos de crear:

```javascript
"production": "cross-env NODE_ENV=production node_modules/webpack/bin/webpack.js --no-progress --hide-modules --config=webpack.config.js"
```

De esta manera primero asignará el directorio de trabajo correcto y después realizará las tareas encontrando el fichero de configuración de tareas.

Finalmente, con este cambio los paquetes se comparten entre releases y el proyecto se despliega en menos de la mitad de tiempo.
