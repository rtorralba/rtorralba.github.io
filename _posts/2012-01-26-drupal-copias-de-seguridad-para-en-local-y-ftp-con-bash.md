---
id: 160
title: Drupal. Copias de seguridad para en local y FTP con BASH.
date: 2012-01-26T18:48:15+00:00
author: rtorralba
layout: post
guid: http://www.artansoft.com/?p=160
permalink: /2012/01/drupal-copias-de-seguridad-para-en-local-y-ftp-con-bash/
interface_sidebarlayout:
  - default
categories:
  - php
  - web
---
En esta noticia os vamos a explicar cómo hacer copias de seguridad de vuestras instalaciones Drupal o de cualquier sitio web con un sencillo script de bash.

<div>
</div>

<div>
  Para ello deberemos tener acceso al shell de nuestro servidor como es lógico.
</div>

<div>
</div>

> <div>
>   <div>
>     #!/bin/bash
>   </div>
> </div>
> 
> <div>
>
> </div>

<div>
  <div>
    Comprobamos que nos pasan los parámetros adecuados, nombre del directorio donde está el proyecto, servidor MySQL, usuario MySQL, password MySQL y nombre de la base de datos MySQL.
  </div>
</div>

<div>
</div>

> <div>
>   <div>
>     if [ $# -ne 5 ]; then
>   </div>
> </div>
> 
> <div>
>   <div>
>       echo &#8220;Es necesario introducir 5 parámetros: $0 PROJECT MYSQL_SERVER MYSQL_USER MYSQL_PASS MYSQL_DATABASE&#8221;
>   </div>
> </div>
> 
> <div>
>   <div>
>       exit -1
>   </div>
> </div>
> 
> <div>
>   <div>
>     fi
>   </div>
> </div>
> 
> <div>
>
> </div>

Escribimos por pantalla que empieza el script y hacemos asignaciones a las variables. Aquí deberemos rellenar las variables que no se pasan por parámetro ($x).<span style="color: #98adad;"><br /> </span>

<div>
  <div>
  </div>
</div>

> <div>
>   <div>
>     echo &#8220;Backuping $1&#8230;&#8221;
>   </div>
> </div>
> 
> <div>
>   <div>
>
>   </div>
> </div>
> 
> <div>
>   <div>
>     PROJECT=$1
>   </div>
> </div>
> 
> <div>
>   <div>
>     FTP_USER=&#8221;usuario_ftp&#8221;
>   </div>
> </div>
> 
> <div>
>   <div>
>     FTP_PASS=&#8221;contraseña_ftp&#8221;
>   </div>
> </div>
> 
> <div>
>   <div>
>     FTP_DIR=&#8221;ruta/ftp&#8221;
>   </div>
> </div>
> 
> <div>
>   <div>
>     FTP_HOST=&#8221;ftp.dominio.com&#8221;
>   </div>
> </div>
> 
> <div>
>   <div>
>     BACKUP_SRC=&#8221;/directorio/base/web/$PROJECT&#8221;
>   </div>
> </div>
> 
> <div>
>   <div>
>     BACKUP_DST=&#8221;backups&#8221;
>   </div>
> </div>
> 
> <div>
>   <div>
>     MYSQL_SERVER=$2
>   </div>
> </div>
> 
> <div>
>   <div>
>     MYSQL_USER=$3
>   </div>
> </div>
> 
> <div>
>   <div>
>     MYSQL_PASS=$4
>   </div>
> </div>
> 
> <div>
>   <div>
>     MYSQL_DATABASE=$5
>   </div>
> </div>

<div>
  <div>
  </div>
  
  <div>
    Asignamos como nombre del tar donde empaquetaremos el backup a el nombre del proyecto, guión, fecha de hoy (año.mes.día) y como destino el especificado arriba en la variable $BACKUP_DST.
  </div>
  
  <div>
  </div>
</div>

> <div>
>   <div>
>     # Stop editing here.
>   </div>
> </div>
> 
> <div>
>   <div>
>     NOW=$(date +&#8221;%Y.%m.%d&#8221;)
>   </div>
> </div>
> 
> <div>
>   <div>
>     DESTFILE=&#8221;$BACKUP_DST/$PROJECT-$NOW.tgz&#8221;
>   </div>
> </div>

<div>
  <div>
  </div>
  
  <div>
    Hacemos el volcado de la base de datos en el fichero $BACKUP_DST/$NOW-Databases.sql .
  </div>
  
  <div>
  </div>
</div>

> <div>
>   <div>
>     echo &#8220;mysqldump $MYSQL_DATABASE&#8230;&#8221;
>   </div>
> </div>
> 
> <div>
>   <div>
>     mysqldump -p &#8211;user=$MYSQL_USER &#8211;host=$MYSQL_SERVER &#8211;password=$MYSQL_PASS &#8211;add-drop-table $MYSQL_DATABASE > &#8220;$BACKUP_DST/$NOW-Databases.sql&#8221;
>   </div>
> </div>

<div>
  <div>
  </div>
  
  <div>
    Empaquetamos todo (directorio del proyecto y volcado de la base de datos) en un tar cuyo nombre y destino habíamos especificado antes.
  </div>
  
  <div>
  </div>
</div>

> <div>
>   <div>
>     echo &#8220;tar $PROJECT&#8230;&#8221;
>   </div>
> </div>
> 
> <div>
>   <div>
>     tar cfz &#8220;$DESTFILE&#8221; $BACKUP_SRC &#8220;$BACKUP_DST/$NOW-Databases.sql&#8221;
>   </div>
> </div>

<div>
  <div>
  </div>
  
  <div>
    Subimos el tar al FTP con los parámetros que habíamos asignado en la asignación de parámetros.
  </div>
  
  <div>
  </div>
</div>

> <div>
>   <div>
>     echo &#8220;Uploading by FTP&#8230;&#8221;
>   </div>
> </div>
> 
> <div>
>   <div>
>     ftp -n $FTP_HOST <<End-Of-Session
>   </div>
> </div>
> 
> <div>
>   <div>
>     # -n option disables auto-logon
>   </div>
> </div>

> <div>
>   <div>
>
>   </div>
> </div>

> <div>
>   <div>
>     user &#8220;$FTP_USER&#8221; &#8220;$FTP_PASS&#8221;
>   </div>
> </div>
> 
> <div>
>   <div>
>     binary
>   </div>
> </div>
> 
> <div>
>   <div>
>     cd $FTP_DIR
>   </div>
> </div>
> 
> <div>
>   <div>
>     put &#8220;$DESTFILE&#8221; &#8220;$PROJECT-$NOW.tgz&#8221;
>   </div>
> </div>
> 
> <div>
>   <div>
>     bye
>   </div>
> </div>
> 
> <div>
>   <div>
>     End-Of-Session
>   </div>
> </div>

<div>
  <div>
  </div>
  
  <div>
    Borramos el archivo de volcado de la base de datos porque ya lo tenemos dentro del tar.
  </div>
</div>

<div>
</div>

> <div>
>   <div>
>     echo &#8220;Removing temporary files&#8230;&#8221;
>   </div>
> </div>

<div>
  <div>
  </div>
</div>

> <div>
>   <div>
>     rm -f &#8220;$BACKUP_DST/$NOW-Databases.sql&#8221;
>   </div>
> </div>
> 
> <div>
>
> </div>

Bueno, como veis es un script muy sencillito (para los que dominien el BASH scripting) pero que nos automatizará la tarea de realizar las copias de seguridad en local y en el FTP.

## Drupal script

<div>
  Como último os podéis hacer otro script que llame a este añadiendo en cada línea un proyecto diferente, así cuando tengáis un proyecto nuevo, para hacer copia de seguridad de este, sólo tendréis que añadir una linea al script que llama al script de copias:
</div>

<div>
</div>

> <div>
>   #!/bin/bash
> </div>
> 
> <div>
>   <div>
>     backup_ftp.sh proyecto1 servidor.base_de_datos.1.com usuario1 contraseña1 base_de_datos1
>   </div>
> </div>
> 
> <div>
>   <div>
>     backup_ftp.sh proyecto2 servidor.base_de_datos.2.com usuario2 contraseña2 base_de_datos2
>   </div>
> </div>
> 
> <div>
>   <div>
>     backup_ftp.sh proyecto3 servidor.base_de_datos.3.com usuario3 contraseña3 base_de_datos3
>   </div>
> </div>
> 
> <div>
>
> </div>

Esperamos que os haya sido de utilidad este script a los Drupaleros y programadores web en general.

<div>
</div>

<div>
  BASH Rulez!
</div>
