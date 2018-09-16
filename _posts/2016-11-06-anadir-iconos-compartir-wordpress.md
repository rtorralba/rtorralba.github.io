---
id: 320
title: WordPress. Añadir iconos para compartir.
date: 2016-11-06T20:23:04+00:00
author: rtorralba
excerpt: Aunque existen distintos plugins que te permiten añadir los iconos de compartir en tus noticias de Wordpress, pueden tener alguna que otra pega. Javascripts adicionales, darte de alta en el servicio de compartir, más pesados...
layout: post
guid: https://www.artansoft.com/?p=320
permalink: /2016/11/anadir-iconos-compartir-wordpress/
interface_sidebarlayout:
  - no-sidebar-full-width
dsq_thread_id:
  - "5726326400"
image: /wp-content/uploads/2016/11/social_longshadow_icons_by_aha_soft_icons-d7ynkqo.png
categories:
  - php
  - web
tags:
  - share
  - social
  - tip
  - php
  - wordpress
---
## Porque añadir los iconos de manera manual en WordPress.

Aunque existen distintos plugins que te permiten añadir los iconos de compartir en tus noticias de WordPress, pueden tener alguna que otra pega:

### Javascripts adicionales.

Estos plugins suelen añadir javascripts adicionales con la respectiva ralentización de carga que además ara que no pasemos el <a href="https://developers.google.com/speed/pagespeed/" target="_blank">pagespeed</a> de Google.

### Darte de alta en el servicio de compartir.

En muchas ocasiones, aunque el plugin de compartir esta muy bien, nos obliga a darnos de alta en el servicio del plugin.

### Más pesados.

No es que sean excesivamente pesados, pero la solución que te dejamos es muy ligera.

## Añadir botones de compartir de manera manual.

Añadimos en el fichero **functions.php** del tema las siguientes funciones en las que podréis ver que no hay nada de javascript, y es tan solo HTML con los enlaces de cada red social para compartir. Para el icono de cada red social hemos usado font-awesome para que sea los más ligero posible, con lo cual tendremos que añadir el enlace a la su css al final de la página antes del cierre de la etiqueta **</body>**. Si os fijáis veréis que hemos tenido que añadir la excepción de buffer porque todavía no tiene icono en font-awesome, aunque parece que pronto lo tendrá:

```php
function artansoft_social_sharing_buttons($content) {
        global $post;
        if(is_singular() || is_home()) {
                $artansoftUrl = urlencode(get_permalink());
                $artansoftTitle = str_replace( ' ', '%20', get_the_title());
                // Get Post Thumbnail for pinterest
                $artansoftThumbnail = wp_get_attachment_image_src( get_post_thumbnail_id( $post-&gt;ID ), 'full' );
 
                $links['twitter'] = 'https://twitter.com/intent/tweet?text='.$artansoftTitle.'&url='.$artansoftUrl.'&via=Artansoft';
                $links['facebook'] = 'https://www.facebook.com/sharer/sharer.php?u='.$artansoftUrl;
                $links['google-plus'] = 'https://plus.google.com/share?url='.$artansoftUrl;
                $links['buffer'] = 'https://bufferapp.com/add?url='.$artansoftUrl.'&text='.$artansoftTitle;
                $links['whatsapp'] = 'whatsapp://send?text='.$artansoftTitle . ' ' . $artansoftUrl;
                $links['linkedin'] = 'https://www.linkedin.com/shareArticle?mini=true&url='.$artansoftUrl.'&title='.$artansoftTitle;
                $links['pinterest'] = 'https://pinterest.com/pin/create/button/?url='.$artansoftUrl.'&media='.$artansoftThumbnail[0].'&description='.$artansoftTitle;
 
                $content .= '<div class="artansoft-social">';
                $content .= '<h5>COMPARTIR</h5>';
                foreach($links as $key => $link) {
                        $class = $key == 'buffer' ? 'square' : $key;
                        $content .= '<a class="artansoft-link artansoft-'.$key.'" href="'.$link.'" target="_blank"><i class="fa fa-'.$class.'"></i> '.ucfirst($key).'</a>';
                }
                $content .= '</div>';
                
                return $content;
        } else {
                return $content;
        }
};
add_filter( 'the_content', 'artansoft_social_sharing_buttons');
```

## En el fichero de estilos CSS

Por último añadimos el CSS para darle estilo a los enlaces que hemos añadido y mostrar el icono de whatsapp sólo en pantalla de resolución móvil:

```css
@media screen and (min-width: 1024px) {
    .artansoft-whatsapp {
        display: none !important;
    }
}
.artansoft-link {
    padding: 2px 8px 4px 8px !important;
    color: white;
    font-size: 12px;
    border-radius: 2px;
    margin-right: 2px;
    cursor: pointer;
    -moz-background-clip: padding;
    -webkit-background-clip: padding-box;
    box-shadow: inset 0 -3px 0 rgba(0,0,0,.2);
    -moz-box-shadow: inset 0 -3px 0 rgba(0,0,0,.2);
    -webkit-box-shadow: inset 0 -3px 0 rgba(0,0,0,.2);
    margin-top: 2px;
    display: inline-block;
    text-decoration: none
}
.artansoft-link:hover,.artansoft-link:active,.artansoft-link:visited {
    color: white;
}
.artansoft-twitter {
    background: #00aced;
}
.artansoft-twitter:hover,.artansoft-twitter:active {
    background: #0084b4;
}
.artansoft-facebook {
    background: #3B5997;
}
.artansoft-facebook:hover,.artansoft-facebook:active {
    background: #2d4372;
}
.artansoft-google-plus {
    background: #D64937;
}
.artansoft-google-plus:hover,.artansoft-google-plus:active {
    background: #b53525;
}
.artansoft-buffer {
    background: #444;
}
.artansoft-buffer:hover,.artansoft-buffer:active {
    background: #222;
}
.artansoft-pinterest {
    background: #bd081c;
}
.artansoft-pinterest:hover,.artansoft-pinterest:active {
    background: #bd081c;
}
.artansoft-linkedin {
    background: #0074A1;
}
.artansoft-linkedin:hover,.artansoft-linkedin:active {
    background: #006288;
}
```

Fuente: Crunchify.com
