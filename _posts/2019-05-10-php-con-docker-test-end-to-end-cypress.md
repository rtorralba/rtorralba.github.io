---
id: 639
title: PHP con Docker. Test end to end con cypress
date: 2020-05-10T23:58:11+02:00
author: rtorralba
excerpt: 'Aunque algunos frameworks como Laravel tienen sus librerías de test end to end más o menos integradas, en este caso sería
el Laravel Dusk, tal vez por diversos motivos queramos usar cypress para nuestros test de aceptación.'
layout: post
guid: https://www.artansoft.com/?p=639
permalink: /2020/05/php-con-docker-desarrollo/
interface_sidebarlayout:
  - default
related_posts:
  - 'a:3:{i:0;i:361;i:1;i:593;i:2;i:229;}'
categories:
  - Docker
  - PHP
  - Web
---
## PHP con Docker. Cypress

Aunque algunos frameworks como Laravel tienen sus librerías de test end to end más o menos integradas, en este caso sería
el Laravel Dusk, tal vez por diversos motivos queramos usar cypress para nuestros tests de aceptación.

En este post explicaré una configuración sencilla para hacer test cypress con docker.

## Añadiendo servicio e2e cypress a docker-compose.yml

Para hacer la prueba he usado el framework ligero de PHP que publique en [GitHub](https://github.com/rtorralba/lpf).

Simplemente tendremos que añadir la carpeta e2e del anterior repositorio y añadir el servicio a vuestro docker-compose.yml:

```yml
    e2e:
      image: cypress
      links:
        - app:lpf.local
      depends_on:
        - app
      environment:
        - CYPRESS_baseUrl=http://lpf.local:8080
        - DISPLAY=unix${DISPLAY}
      command: tail -f /dev/null
      volumes:
        - ./e2e/cypress:/app/cypress
        - ./e2e/cypress.json:/app/cypress.json
        - /dev/shm:/dev/shm
        - /tmp/.X11-unix:/tmp/.X11-unix
```

Como véis, en el servicio usamos la imagen de cypress:
* Añadimos el link a la app para que desde el contendor de cypress se pueda acceder al servicio donde corre la misma.
* En el entorno le pasamos la URL a partir de la cual tendrá que ejecutar los tests.
* Compartimos la carpeta cypress para meter los tests en el contenedor y la configuración del fichero cypress.json.
* Por último, añadimos un volumen y variable de entorno, para que los tests se puedan ejecutar en nuestra pantalla 
(.X11-unix, DISPLAY) y el volumen /dev/shm para no tener problemas de memoría.

## Ejecutando los tests.

Para ejecutar los tests sin tener que entrar en el contenedor ejecutad los siguientes comandos:

```bash
DISPLAY=:0 # Aquí tienes que poner tu display, suele ser :0, pero puedes averiguarlo con el comando who.
export DISPLAY
xhost +
```

Ya por último si queremos ejecutar los tests en consola:

```bash
docker-compose exec e2e npx cypress run
```

<amp-img width="800" height="738" layout="responsive" alt="Ejecución cypress php" src="{{site.url}}/assets/images/posts/cypress.png"></amp-img>

Si preferimos abrir la consola de cypress para ejecutar los tests:

```bash
docker-compose exec e2e npx cypress open
```
