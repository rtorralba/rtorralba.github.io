---
id: 342
title: Guard Clauses. Que son y que beneficios tienen.
date: 2017-01-23T02:04:39+00:00
author: rtorralba
excerpt: Para explicar que son las guard clauses o clausulas de guarda y que beneficios tienen, vamos a poner primero un ejemplo de código en el cual no se usan para ver que problemas tiene y cómo las guard clauses nos pueden ayudar a solucionarlos.
layout: post
guid: https://www.artansoft.com/?p=342
permalink: /2017/01/guard-clauses-definicion-beneficios/
interface_sidebarlayout:
  - default
dsq_thread_id:
  - "5742830587"
rop_post_url_twitter:
  - 'https://www.artansoft.com/2017/01/guard-clauses-definicion-beneficios/?utm_source=ReviveOldPost&utm_medium=social&utm_campaign=ReviveOldPost'
image: /wp-content/uploads/2017/01/source-code-583537_640.jpg
categories:
  - buenas-practicas
  - php
tags:
  - php
  - programming
---
Para explicar que son las **guard clauses** o **clausulas de guarda** y que beneficios tienen, vamos a poner primero un ejemplo de código en el cual no se usan para ver que problemas tiene y cómo las guard clauses nos pueden ayudar a solucionarlos.

<pre class="brush: php; title: ; notranslate" title="">public function divide(int $divider): float
{
	if ($this-&gt;getValue() &gt; 0) {
    	if ($divider &gt; 0) {
      		if ( $divider != 1) {
        		return $this-&gt;getValue()/$divider;
      		} else {
				return $this-&gt;getValue();
	  		}
    	} else {
			throw new Exception('División por cero.');
    	}
  	} else {
    	return 0;
  	}
}
</pre>

## Problemas que nos encontramos en el ejemplo

### Indentación excesiva

Al tener varios IFs anidados la <a href="https://es.wikipedia.org/wiki/Indentaci%C3%B3n" target="_blank">indentación</a> se nos va demasiado hacia la derecha dificultando la lectura del código.

### Correlación de IF con ELSE

En este ejemplo igual no es demasiado complicado, pero si cada parte del IF y/o ELSE tuviera un poco más de código, nos costaría saber que IF va con que ELSE bajando hasta la correspondiente línea.

### Seguir la traza mentalmente

Tal cómo está, nos obligaría al leer la función a seguir la traza y mantener la &#8220;pila&#8221; de condiciones mentalmente. Llego a la linea 6 porque ni el valor del objeto actual es 0, el divisor es mayor que 0 y distinto de 1.

## Guard clauses es la solución

<pre class="brush: php; title: ; notranslate" title="">public function divide(int $divider): float
{
  	if ($this-&gt;getValue() = 0) {
		return 0;
	}
	
	if ($divider == 0) {
		throw new Exception('División por cero.');
	}

	if ($divider == 1) {
		return $this-&gt;getValue();
	}

	return $this-&gt;getValue()/$divider;
}
</pre>

Cómo vemos, con las guard clauses vamos comprobando primero una a una todas las condiciones que se deben cumplir antes de hacer lo que la función tiene que hacer, solucionando toso los problemas anteriores, indentación excesiva, no tenemos que saber que IF va con que ELSE, y por último y diría que más importante, no debemos mantener la &#8220;pila&#8221; de condiciones de la traza mentalmente.

Si es el valor actual del objeto es igual a 0 devuelvo 0, sinó continuo y me &#8220;olvido&#8221; de esa condición porque ya la he cumplido.
