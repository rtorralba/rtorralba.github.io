---
id: 28
title: Codeigniter. Un poco de organización
date: 2014-10-21T13:58:39+00:00
author: rtorralba
layout: post
guid: http://wordpress.artansoft.com/2014/10/21/codeigniter-un-poco-de-organizacion-unos-de-los/
permalink: /2014/10/codeigniter-un-poco-de-organizacion-unos-de-los/
tumblr_artansoft_permalink:
  - http://artansoft.tumblr.com/post/125864191498/codeigniter-un-poco-de-organización-unos-de-los
tumblr_artansoft_id:
  - "125864191498"
interface_sidebarlayout:
  - default
dsq_thread_id:
  - "4928182484"
rop_post_url_twitter:
  - 'https://www.artansoft.com/2014/10/codeigniter-un-poco-de-organizacion-unos-de-los/?utm_source=ReviveOldPost&utm_medium=social&utm_campaign=ReviveOldPost'
categories:
  - vim
tags:
  - codeigniter
  - php
  - programming
format: gallery
---
Unos de los frameworks PHP con una curva de aprendizaje menos pronunciada, con menos bootstrapping, y mayor libertad para hacer las cosas de varias maneras es codeigniter. Estas características lo hacen muy versátil pero vamos a darte unos consejos de organización para ganar en legibilidad y orden de tus proyectos.

No repliques el framework.Para un inicio más sencillo con codeigniter este incluye su **system**, pero esto, a la larga, si se hacen varios proyectos con este framework, no es lo mejor indicado si no se quiere arrastrar este core en cada proyecto.

<!-- more -->

Para evitar esto puedes cambiar la estructura por defecto con la siguente:

  * codeigniter/ 
      * codeigniter/ 
          * system/
          * user_guide/
          * license.txt
      * webs/ 
          * web1/ 
              * application/
              * index.php
          * web2/ 
              * application/
              * index.php
          * web3/ 
              * application/
              * index.php

Para esto funcione correctamente, simplemente tendrás que cambiar la variable **$system_path **del fichero de configuración de cada web (index.php) de:

> $system_path = ‘system’;

a:

> $system_path = ’../../codeigniter/system’;

Con esta organización si tenemos que actualizar la versión de codeigniter, cambiando la carpeta

**codeigniter/codeigniter**

este se actualizará para todas las webs.

Además no tendremos que incluir el framework en nuestro repositorio de código para que con un sólo clone ya funcione el proyecto y queda mejor definido cuales son realmente los ficheros de cada web.
