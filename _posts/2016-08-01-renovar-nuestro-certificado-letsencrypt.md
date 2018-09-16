---
id: 275
title: 'Renovar nuestro certificado Let&#8217;s Encrypt'
date: 2016-08-01T02:18:52+00:00
author: rtorralba
excerpt: |
  Cómo renovar nuestro certificado Let's Encrypt automáticamente para nuestro dominio en nuestro servidor en unos sencillos pasos.
  
  Para llevar a cabo la renovación Let's Encrypt recoredemos que, en el post anterior, explicamos cómo crear un certificado con esta nueva autoridad certificadora gratuita, automática y abierta que además está reconocida por la mayoría de navegadores, diríamos que todos.
layout: post
guid: https://www.artansoft.com/?p=275
permalink: /2016/08/renovar-nuestro-certificado-letsencrypt/
hefo_before:
  - "0"
hefo_after:
  - "0"
interface_sidebarlayout:
  - default
dsq_thread_id:
  - "5029956725"
image: /wp-content/uploads/2016/08/Captura-de-pantalla-de-2016-08-01-03-15-26.png
categories:
  - web
tags:
  - certificate
  - https
  - server
  - web
---
## A tener en cuenta antes de renovar nuestro certificado Let&#8217;s Encrypt

Para llevar a cabo la renovación Let&#8217;s Encrypt recoredemos que, en el post anterior, explicamos cómo crear un certificado con esta nueva autoridad certificadora gratuita, automática y abierta que además está reconocida por la mayoría de navegadores, diríamos que todos.

Estos certificados tienen una caducidad de 3 meses, por lo que debemos ir actualizándolo. Con la utilidad [certbot](https://certbot.eff.org/), disponible para casi todos los sistemas operativos y servidores web, y que ya utilizamos para crear el certificado, podemos renovarlo.

Cuando ejecutamos el comando de renovación, está hace una serie de comprobaciones, y si al certificado le queda menos de un mes de validez, lo renueva.

## Renovación

Para renovar el certificado por consola, deberemos ejecutar el siguiente comando:

    letsencrypt renew --agree-tos --text --non-interactive --email nombre@tudominio.com
    

Si en la instalación del certificado ya pusimos nuestro e-mail, no es necesario este parámetro, porque ya estará en al configuración de [Let&#8217;s Encrypt](https://letsencrypt.org/) para el dominio.

Cosas a tener en cuenta en la ejecución de este comando:

  * El parámetro &#8211;agree-tos es para aceptar los términos y condiciones.
  * La opción &#8211;text, es para realizar la acción sin ninguna interfaz gráfica, sólo con texto.
  * &#8211;non-interactive es para que realice la acción sin preguntar nada en la linea de comandos.
  * Para que la ejecución no falle, entre otras cosas, la sintaxis de los virtualhost debe ser correcta, puedes comprobarlo con el comando **apachectl configtest**
  * Debes ejecutarlo cómo usuario root.

## Automatización por cron

La manera más cómoda para renovar el certificado es automatizarlo. Para ello puedes usar el cron.

En este punto tenemos pequeño problema cuando se ejecuta en el cron porque no tiene los valores que necesita en el PATH, lo puedes arreglar con un script **letsencrypt-renew.sh**:

    PATH=$PATH:/usr/sbin
    export PATH && letsencrypt renew --agree-tos --text --non-interactive --email nombre@tudominio.com --verbose >> /var/log/le-renew.log
    

Ya que, cómo comentábamos se debe de ejecutar cómo root, lo tendrás que añadir en el cron de este.

Para ejecutar el script todos los viernes a la 1:30 de la madrugada, introduciremos la siguiente linea en el cron.

    30 01 * * 5 /path/al/script/letsencrypt-renew.sh
    

Recuerda que el comando comprueba si es necesaria la renovación, con lo que podemos comprobarlo cada semana.
