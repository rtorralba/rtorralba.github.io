---
id: 604
title: Gestión de tareas multiproyecto con Gitlab
date: 2017-11-08T00:35:09+00:00
author: rtorralba
excerpt: |
  Todos conocemos herramientas de la gestión de tareas de proyectos como Trello, Taiga... pero en ocasiones, el día a día de un desarrollador no se ciñe simplemente al desarrollo de un solo proyecto, sino que participa en varios e incluso debe de resolver incidencias de legacy code de proyectos en los que no ha participado en el desarrollo inicial.
  
  En los siguientes puntos, explicaré que herramientas tiene GitLab para la gestión de tareas y que posibilidad tenemos para resolver la gestión de multiproyecto.
layout: post
guid: https://www.artansoft.com/?p=604
permalink: /2017/11/gestion-de-tareas-gitlab/
related_posts:
  - 'a:1:{i:0;i:235;}'
interface_sidebarlayout:
  - default
dsq_thread_id:
  - "6269399848"
image: /wp-content/uploads/2017/11/gitlab-blog-cover.png
categories:
  - agile
  - buenas-practicas
---
## Gestión de tareas

Todos conocemos herramientas de la gestión de tareas de proyectos como <a href="https://trello.com/" target="_blank" rel="noopener">Trello</a>, <a href="https://www.artansoft.com/2016/03/proyectos-agiles-taiga/" target="_blank" rel="noopener">Taiga</a>&#8230; pero en ocasiones, el día a día de un desarrollador no se ciñe simplemente al desarrollo de un solo proyecto, sino que participa en varios e incluso debe de resolver incidencias de legacy code de proyectos en los que no ha participado en el desarrollo inicial.

En los siguientes puntos, explicaré que <a href="https://docs.gitlab.com/ee/user/project/issues/" target="_blank" rel="noopener">herramientas</a> tiene GitLab para la gestión de tareas y que posibilidad tenemos para resolver la gestión de multiproyecto.

## GitLab

Hace poco añadimos GitLab como gestor de proyectos, entre otras cosas, por la similitud de manejo con otros gestores y porque tenía una gestión de tareas dentro de la herramienta.

GitLab ofrece un gestor de tareas por proyecto, con la posibilidad de añadir <a href="https://docs.gitlab.com/ee/user/project/issue_board.html" target="_blank" rel="noopener">un tablero muy scrum style</a>. Por defecto te crea 4 columnas. Backlog, To Do, Doing, Closed. La primera y la última se pueden plegar. La interpretación que hacemos de esta funcionalidad es la siguiente:

  * En las columnas la prioridad de las tareas la marca la posición, poniendo las más prioritarias arriba.
  * En la columna Backlog entrarían todas las historias de usuario, ordenadas de más a menos valor para el Product Owner.
  * Cuando decidamos que tareas se desarrollaran en en siguiente sprint, se añadirán en la columna To Do.
  * En el momento que estamos ejecutando una tarea la añadimos a la columna Doing.
  * Normalmente creamos una columna Waiting en la que pondremos aquellas tareas que están paradas porque estamos esperando algo que nos permita continuar con ellas.
  * Cuando terminamos las tareas las pasamos a Closed, a ser posible, con el commit que la ha cerrado para que quede enlazado que modificación ha cerrado la misma.

<img class=" wp-image-606 aligncenter" src="https://www.artansoft.com/wp-content/uploads/2017/11/issue_board_welcome_message-300x108.png" alt="Gestión de tareas con el tablero de GitLab" width="844" height="304" srcset="https://www.artansoft.com/wp-content/uploads/2017/11/issue_board_welcome_message-300x108.png 300w, https://www.artansoft.com/wp-content/uploads/2017/11/issue_board_welcome_message.png 1353w" sizes="(max-width: 844px) 100vw, 844px" />

Con esto, GitLab resuelve muy bien la gestión de tareas de un proyecto con un tablero, que sin llegar a tener todas las funcionalidades de Trello, ya que es un producto especializado en tableros, cubre todo lo necesario para gestionarlas.

Pero bien, volviendo al principio, ¿Que pasa si estoy participando en 3 proyectos? ¿Donde puedo ver que tengo pendiente? Las tareas están priorizadas dentro del proyecto, ¿Pero que prioridad tienen respecto a las de otros? Esto lo podemos resolver con la vista global de issues de GitLab.

## Vista global de issues

En esta vista, a la que podremos acceder clicando en el icono de issues que aparece en la barra en la parte superior derecha. podremos resolver el caso que planteábamos al principio ya que, en esta vista podremos ver cuales son todas las tareas pendientes por miembro del equipo, pero no sólo eso, con el uso de etiquetas con prioridad, podremos priorizarlas en esta vista de manera que, podremos priorizar conjuntamente todas las tareas aunque sean de proyectos distintos.

El resultado es que visualizaremos todas nuestras tareas con una prioridad asignada de manera general.

De sobra es sabido que lo aconsejable es no cambiar mucho de proyecto para mantener el foco y que sea más productivo el trabajo. Pero en ocasiones algunas tareas de otros proyectos tienen mucha más prioridad y hay que cambiar.

En la siguiente imagen podréis ver como nos marca GitLab en la barra de menú que tenemos, 5 issues, 6 merge requests y 2 To Do&#8217;s pendientes.

<img class="alignnone size-medium wp-image-608" src="https://www.artansoft.com/wp-content/uploads/2017/11/to-do-300x70.png" alt="Iconos de la barra de menú de GitLab" width="300" height="70" srcset="https://www.artansoft.com/wp-content/uploads/2017/11/to-do-300x70.png 300w, https://www.artansoft.com/wp-content/uploads/2017/11/to-do.png 334w" sizes="(max-width: 300px) 100vw, 300px" />

Imágenes de <a href="http://gitlab.com" target="_blank" rel="noopener">gitlab.com</a>
