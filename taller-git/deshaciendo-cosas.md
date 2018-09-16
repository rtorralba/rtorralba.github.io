---
id: 514
title: Taller de GIT. Deshaciendo cosas
date: 2017-05-08T00:19:26+00:00
author: rtorralba
layout: page
guid: https://www.artansoft.com/?page_id=514
interface_sidebarlayout:
  - default
---
## Commit

**git commit &#8211;amend**

## Stage

**git reset HEAD <file>**

## Deshaciendo la modificación de un archivo

**git checkout &#8212; <file>**

## Deshaciendo **[n]** commits de manera permanente donde

**git reset &#8211;hard HEAD~n**

E.g. **git reset &#8211;hard HEAD~3**

## Deshaciendo [n] commits creando un commit nuevo.

En este caso no eliminamos los commits, sino que creamos uno nuevo dejando el repositorio sin los commit eliminados, pero mantenemos el historial.

**git revert <commit>**

**git revert HEAD~3**