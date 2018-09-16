---
id: 162
title: HTML. Elementos que desaparecerán en breve
date: 2012-02-27T23:26:09+00:00
author: rtorralba
layout: post
guid: http://www.artansoft.com/?p=162
permalink: /2012/02/html-elementos-que-desapareceran-en-breve/
interface_sidebarlayout:
  - default
categories:
  - web
---
<img class="alignnone size-medium wp-image-163 alignright" src="https://www.artansoft.com/wp-content/uploads/2016/03/HTML5-logo3-227x300.jpg" alt="HTML 5 Logo" width="227" height="300" srcset="https://www.artansoft.com/wp-content/uploads/2016/03/HTML5-logo3-227x300.jpg 227w, https://www.artansoft.com/wp-content/uploads/2016/03/HTML5-logo3.jpg 231w" sizes="(max-width: 227px) 100vw, 227px" />Si te dedicas al mundo del desarrollo web, sabrás que con cada versión nueva de HTML, al igual que ocurren en otras tecnologías, hay elementos que aparecen y otros que desaparecen o se marcan como deprecated para avisar de que deseparecerán en breve.

Con el tránsito definitivo a HTML5 del que tantísimo se lleva hablando, algunos elementos dejarán de existir. Aquí os traigo un listado de ellos, cuál era su función y cómo debemos sustituir su funcionalidad.

### <a name="TOC-acronym-"></a><acronym>

<div>
  <p>
    Se usaba para describir acrónimos (por ejemplo NASA) en HTML4, sin embargo ahora deberemos usar la etiqueta <abbr>.
  </p>
  
  <h3>
    <a name="TOC-applet-"></a><applet>
  </h3>
  
  <p>
    Esta etiqueta se usaba para introducir applets dentro de la web, sin embargo, ahora debemos usar <object>.
  </p>
  
  <h3>
    <a name="TOC-basefont-"></a><basefont>
  </h3>
  
  <p>
    Definía características de la fuente por defecto: color, tamaño y familia; para todo el documento. Esto mismo podemos hacerlo vía CSS.
  </p>
  
  <h3>
    <a name="TOC-big-"></a><big>
  </h3>
  
  <p>
    Como su nombre indica, servía para hacer el texto más grande, con CSS podemos hacer esto mismo de varias formas.
  </p>
</div>

<div>
  <h3>
    <a name="TOC-center-"></a><center>
  </h3>
  
  <p>
    Centraba horizontalmente el contenido, un remedio rápido para un problema frecuente. La solución correcta usar CSS.
  </p>
  
  <h3>
    <a name="TOC-dir-"></a><dir>
  </h3>
  
  <p>
    Etiqueta para definir listados de directorios, ha dejado de tener sentido como tal y en su lugar debemos usar <ul>.
  </p>
  
  <h3>
    <a name="TOC-font-"></a><font>
  </h3>
  
  <p>
    Para especificar la fuente de un texto, incluye el estilo dentro del contenido, por lo que debemos evitarla a toda costa. Su labor la hacemos usando CSS.
  </p>
  
  <h3>
    <a name="TOC-frame-"></a><frame>
  </h3>
  
  <p>
    En los tiempos en que no existía AJAX, los frames eran una de las mejores formas de hacer recargas parciales de las páginas. Esta opción desaparece en HTML5. Si habéis trabajado alguna vez con ellos, aparte de antiestéticos os habrán dado quebraderos de cabeza de todo tipo, mucho mejor recargar div de forma asíncrona.
  </p>
  
  <h3>
    <a name="TOC-frameset-"></a><frameset>
  </h3>
  
  <p>
    Relacionada con la anterior, era parte del funcionamiento de los frames.
  </p>
  
  <h3>
    <a name="TOC-noframes-"></a><noframes>
  </h3>
  
  <p>
    También relacionada con las dos anteriores.
  </p>
  
  <h3>
    <a name="TOC-strike-"></a><strike>
  </h3>
  
  <p>
    Etiqueta muy poco utilizada, servía para hacer justo esto con el texto, ahora usamos <del> en su lugar.
  </p>
  
  <h3>
    <a name="TOC-tt-"></a><tt>
  </h3>
  
  <p>
    Usada para definir texto de teletipos, ahora usamos CSS.
  </p>
  
  <h3>
    <a name="TOC-u-"></a><u>
  </h3>
  
  <p>
    Utilizado para indicar texto subrayado, ahora usamos CSS y más concretamente: text-decoration:underline.
  </p>
</div>

<div>
</div>

<div>
  Fuente:Linux Hispano.
</div>
