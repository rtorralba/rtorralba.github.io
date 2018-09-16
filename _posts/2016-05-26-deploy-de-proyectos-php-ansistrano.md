---
id: 259
title: Deploy de proyectos PHP con Ansistrano, basado en ansible
date: 2016-05-26T23:02:20+00:00
author: rtorralba
excerpt: |
  En otro post explicamos otra herramienta para hacer deploy de proyectos PHP, MagePHP. En esta ocasión os explicamos como hacerlo con Ansistrano, otra herramienta que nos ha gustado un poco más y que además tiene la ventaja de estar basada en ansible, con lo que nos da acceso a las tareas de automatización disponibles en dicho estándar.
  
  Aunque por el nombre algunos ya lo habréis deducido, la herramienta es un port de la ya conocida herramienta de deploys hecha con rubi Capistrano a PHP.
layout: post
guid: https://www.artansoft.com/?p=259
permalink: /2016/05/deploy-de-proyectos-php-ansistrano/
hefo_before:
  - "0"
hefo_after:
  - "0"
interface_sidebarlayout:
  - default
dsq_thread_id:
  - "4860547995"
rop_post_url_twitter:
  - 'https://www.artansoft.com/2016/05/deploy-de-proyectos-php-ansistrano/?utm_source=ReviveOldPost&utm_medium=social&utm_campaign=ReviveOldPost'
image: /wp-content/uploads/2015/12/deploy_optimizada.png
categories:
  - php
  - web
---
En otro post explicamos otra herramienta para hacer deploy de proyectos PHP, [MagePHP](https://www.artansoft.com/2015/12/magallanes-herramienta-para-deploy-en-php/). En esta ocasión os explicamos como hacerlo con <a href="http://ansistrano.com/" target="_blank">Ansistrano</a>, otra herramienta que nos ha gustado un poco más y que además tiene la ventaja de estar basada en ansible, con lo que nos da acceso a las tareas de automatización disponibles en dicho estándar.

Aunque por el nombre algunos ya lo habréis deducido, la herramienta es un port de la ya conocida herramienta de deploy de proyectos php hecha con rubi <a href="http://capistranorb.com/" target="_blank">Capistrano</a> a PHP.

## Instalación

### Instalar ansible en tu máquina, por ejemplo en ubuntu:

<pre>apt-get install ansible</pre>

### Instalar los roles de deploy y rollback de ansistrano:

<pre>ansible-galaxy install carlosbuenosvinos.ansistrano-deploy carlosbuenosvinos.ansistrano-rollback</pre>

## Configuración del deploy de proyectos PHP

### Configuración básica

Para configurar un deploy básico en nuestro proyecto, en principio sólo necesitariamos 3 ficheros, deploy.yml, rollback.yml y hosts. Cómo imaginaréis en el primero especificaremos los parámetros de deploy, en el segundo de rollback y en el tercero definiremos los hosts en los que se realizará el despliegue.

Definir los hosts en un fichero separado es útil para definir distintos entornos de deploy, hosts-preprod, hosts-prod.

Por último, para ser un poquito más ordenados, recomendamos definir todos los ficheros dentro de una carpeta, por ejemplo .ansistrano.

Cuidado al copiar el texto ya que la indentación es importante en el formato yml.

#### .ansistrano/deploy.yml

<pre>---
- name: Deploy de proyectos php ejemplo de my-app
  hosts: all
  remote_user: user # Usuario con el que intentará conectarse por ssh a los hosts
  vars:
    ansistrano_deploy_from: "{{ playbook_dir }}/.." # Ruta local al proyecto (relativo or absoluto)
    ansistrano_deploy_to: "/var/www/my-app" # Ruta de despliegue en el servidor
    ansistrano_keep_releases: 3 # Número de releases que queremos que mantenga
  roles:
    - carlosbuenosvinos.ansistrano-deploy</pre>

#### .ansistrano/rollback.yml

<pre>---
- name: Rollback de ejemplo de my-app
  hosts: all
  remote_user: user # Usuario con el que intentará conectarse por ssh a los hosts
  vars:
    ansistrano_deploy_to: "/var/www/my-app" # Ruta de despliegue en el servidor
  roles:
    - carlosbuenosvinos.ansistrano-rollback</pre>

### Excluir ficheros y/o carpetas en el deploy

Con el fichero de configuración anterior tendríamos un deploy básico, pero ahora imaginemos que queremos excluir algunos ficheros del deploy. Bien, pues si usamos la estrategia de deploy que ejecuta por defecto, rsync, os recomendamos que lo hagáis de la siguiente manera:

#### Crear fichero .ansistrano/rsync-exclude

Una manera limpia de hacerlo, es añadir en este fichero todo lo que querramos excluir:

<pre>.git
.gitignore
uploads/*</pre>

Y después añadir la siguiente linea en el fichero .ansistrano/deploy.yml:

<pre>ansistrano_rsync_extra_params: "--exclude-from=.ansistrano/rsync-exclude"</pre>

### Shared Paths

Cuando hacemos un deploy se crea una carpeta nueva en releases y después de cambia el link current a la nueva carpeta. Entonces, ¿que pasa con los ficheros generados dinamicamente (logs, uploads&#8230;)?

Para esto en ansistrano podemos definir los shared paths y con ello, ansistrano lo que hará es no desplegar los ficheros contenidos en esos paths y en vez de crear las carpetas en el servidor, creará enlaces directos relativos a la carpeta shared del proyecto.

Recordemos que la estuctura generada al desplegar un proyecto con ansistrano será la siguiente:

<pre>/var/www/my-app/
/var/www/my-app/releases/
/var/www/my-app/releases/release1
/var/www/my-app/releases/release2
/var/www/my-app/shared/
/var/www/my-app/current -&gt; /var/www/my-app/releases/release2
</pre>

Entonces para evitar perder los ficheros que se han generado dinámicamente online, crearemos las carpetas en el directorio shared y les daremos los permisos oportunos, por ejemplo:

<pre>/var/www/my-app/shared/logs/
/var/www/my-app/shared/logs/uploads/</pre>

Y añadiremos las siguientes líneas en el apartado vars del fichero .ansistrano/deploy.yml:

<pre>ansistrano_shared_paths:
  - logs
  - uploads</pre>

Al definir los shared paths hay que tener en cuenta que son relativos al directorio del proyecto, en el ejemplo anterior las carpetas logs y uploads estan en la raiz del mismo, si estuvieran dentro de la carpeta tmp la configuración hubiera sido la siguiente:

<pre>ansistrano_shared_paths:
  - tmp/logs
  - tmp/uploads</pre>

Además no hay que añadir la barra al final de la definición de paths.

### Definir tareas a ejecutar en cualquiera de las fases del workflow del deploy

Una de las posibilidades que suelen ofrecer estas herramientas es la posibilidad de ejecutar tareas antes y después de cada fase del deploy de proyectos php:

<pre><span class="pl-s"><span class="pl-ent">ansistrano_before_setup_tasks_file:</span> <span class="pl-s"><span class="pl-pds">"</span>my-before-setup-tasks.yml<span class="pl-pds">"</span></span></span>
<span class="pl-s"><span class="pl-ent">ansistrano_after_setup_tasks_file:</span> <span class="pl-s"><span class="pl-pds">"</span>my-after-setup-tasks.yml<span class="pl-pds">"</span></span></span>
<span class="pl-s"><span class="pl-ent">ansistrano_before_update_code_tasks_file:</span> <span class="pl-s"><span class="pl-pds">"</span>my-before-update-code-tasks.yml<span class="pl-pds">"</span></span></span>
<span class="pl-s"><span class="pl-ent">ansistrano_after_update_code_tasks_file:</span> <span class="pl-s"><span class="pl-pds">"</span>my-after-update-code-tasks.yml<span class="pl-pds">"</span></span></span>
<span class="pl-s"><span class="pl-ent">ansistrano_before_symlink_shared_tasks_file:</span> <span class="pl-s"><span class="pl-pds">"</span>my-before-symlink-shared-tasks.yml<span class="pl-pds">"</span></span></span>
<span class="pl-s"><span class="pl-ent">ansistrano_after_symlink_shared_tasks_file:</span> <span class="pl-s"><span class="pl-pds">"</span>my-after-symlink-shared-tasks.yml<span class="pl-pds">"</span></span></span>
<span class="pl-s"><span class="pl-ent">ansistrano_before_symlink_tasks_file:</span> <span class="pl-s"><span class="pl-pds">"</span>my-before-symlink-tasks.yml<span class="pl-pds">"</span></span></span>
<span class="pl-s"><span class="pl-ent">ansistrano_after_symlink_tasks_file:</span> <span class="pl-s"><span class="pl-pds">"</span>my-after-symlink-tasks.yml<span class="pl-pds">"</span></span></span>
<span class="pl-s"><span class="pl-ent">ansistrano_before_cleanup_tasks_file:</span> <span class="pl-s"><span class="pl-pds">"</span>my-before-cleanup-tasks.yml<span class="pl-pds">"</span></span></span>
<span class="pl-s"><span class="pl-ent">ansistrano_after_cleanup_tasks_file:</span> <span class="pl-s"><span class="pl-pds">"</span>my-after-cleanup-tasks.yml<span class="pl-pds">"
</span></span></span></pre>

Por ejemplo si queremos definir una tarea para que después de crear el enlace a la actual release haga un reload del servicio apache tendríamos que añadir la siguiente linea en el apartado vars del fichero .ansistrano/deploy.yml:

<pre>ansistrano_after_symlink_tasks_file: "my-after-symlink-tasks.yml"</pre>

Y crear el fichero .ansistrano/my-after-symlink-tasks.yml con el siguiente contenido:

<pre>- shell: sudo service httpd reload</pre>

Esta tarea suele ser necesaria en servidores en los que está activado un servicio de cache cómo el APC, ya que al crear la release la cache no se actualiza y puede dar errores.

Para hacer esto sera necesario habilitar al usuario que se usa para el deploy la posibilidad de ejecutar el anterior comando sin pedir la contraseña.

## Conclusión

Nos ha encantado este sistema de deploy por su sencillez y potencial por estar basado en ansible. 100% recomendable.
