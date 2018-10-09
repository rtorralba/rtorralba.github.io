---
title: Jekyll. Redirigir URLs
date: 2018-10-09T23:15:11+02:00
author: rtorralba
excerpt: 'Wordpress tiene un plugin que te genera las páginas en amp en la misma url de la página pero terminada en /amp. Al pasar el blog, los enlaces /amp dejaron de funcionar, por lo que tuve que redirigirlos todos a la url sin la terminación amp.'
layout: post
permalink: /2018/10/jekyll-redireccion/
categories:
  - Web
  - GitHub
  - Jekyll
---
## Jekyll. Introducción

Tras el "experimento" de wordpress, y aconsejado por un amigo, he migrado el blog al generador de páginas Jekyll por:

* Sencillez de manejo y escritura de posts (Markdown).
* Hosting en GitHub.
* Velocidad al ser páginas estáticas (además he usado un tema en amp)

## Redirección

Wordpress tiene un plugin que te genera las páginas en amp en la misma url de la página pero terminada en /amp. Al pasar el blog, los enlaces /amp dejaron de funcionar, por lo que tuve que redirigirlos todos a la url sin la terminación amp, ya que ahora directamente son amp.

Jekyll no tiene redirecciones como las que podemos hacer en apache con .htaccess, pero puedes crear una página la típica etiqueta meta para redireccionar. Para no tener que repetir todo el html en todas las redirecciones crearemos una plantilla redirect.html para reutilizarla.

```html
---
---

<!doctype html>
<html>
    <head>
        <meta http-equiv="refresh" content="0; url={{site.lcb}}{{page.newUrl}}{{site.rcb}}">
        <link rel="canonical" href="{{site.lcb}}{{page.newUrl}}{{site.rcb}}" />
    </head>
</html>
```

Después, para tenerlo un poco organizado, crearemos una carpeta redirects donde meteremos todas las páginas que nos redireccionarán, y estas tendrán un contenido como el siguiente ejemplo:

```yaml
---
layout: redirect
permalink: /2018/07/php-con-docker-integracion-continua-ci-gitlab/amp/
newUrl: /2018/07/php-con-docker-integracion-continua-ci-gitlab/
---
```

Con esto tendremos la redirección. Me temo que las redirecciones con meta refresh no son lo mismo para el buscador que una redirección 301, pero al menos nuestras páginas no fallaran (404).

## Generar redirecciones automáticamente

Como normalmente la cantidad de posts es considerable, os dejo un pequeñito script muy sencillo para generar automáticamente las redirecciones

```bash
for i in _posts/*; do
    fileName=`basename $i`
    permalink=$(cat $i | grep ^permalink | cut -d" " -f2)
    ampPermalink=${permalink}amp/
    redirectFile=redirects/$fileName
    if [[ ! -f $redirectFile ]]; then
        touch $redirectFile
        echo "---" >> $redirectFile
        echo "layout: redirect" >> $redirectFile
        echo "permalink: $ampPermalink" >> $redirectFile
        echo "newUrl: $permalink" >> $redirectFile
        echo "---" >> $redirectFile
    fi
done
```
