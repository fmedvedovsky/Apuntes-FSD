#set text(
  font: "Times New Roman",
)

#show raw.where(block: true): it => block(
  fill: rgb("#1d2433"),
  inset: 8pt,
  text(fill: rgb("#ffffff"), it)
)

#show raw.where(block:false): it => box(
  fill: rgb("#31748f"), 
  inset: 4pt,
  baseline: 25%,
  
  text(fill: rgb("#e0def4"), it)
)

#text(18pt, weight: "bold")[Apuntes del curso "Full Stack Developer" del ITBA]

#outline(title: "Índice")
#pagebreak()

= HTML
== ¿Qué es HTML?
HyperText Markup Language (HTML) es un lenguaje de marcado, cuya función es marcar el contenido de una página web con etiquetas para describir su estructura y semántica.

== Estructura fundamental de un documento HTML
```html
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>El Título de mi Página</title>
</head>
<body>
</body>
</html>
```

- *`<!DOCTYPE html>:`* declara que es un documento *HTML5*. Es siempre la primera línea.
- *`<html>:`* la etiqueta raíz que envuelve todo. El atributo *`lang="es"`* indica que el idioma es español, crucial para la accesibilidad.
- *`<head>:`* contiene *metadatos* (información sobre la página) que no son visibles para el usuario, como el *`<title>`* de la pestaña del navegador y la codificación de caracteres.
- *`<meta charset="UTF-8">:`* la etiqueta más importante del *`<head>`*. Asegura que el navegador interprete correctamente todos los caracteres, incluyendo acentos (á, é, í), la letra ñ y emojis (🚀).
- *`<body>:`* aquí va *todo el contenido* visible de la página.

== Elementos
Un elemento HTML generalmente se compone de:
- Una *etiqueta de apertura* (ej: `<p>`).
- El *contenido* (texto, u otros elementos).
- Una *etiqueta de cierre* (ej: `</p>`).

Los *atributos* van dentro de la etiqueta de apertura (`<etiqueta atributo="valor">`) y proveen información adicional sobre el elemento.

== Etiquetas esenciales

=== Títulos
Los títulos se usan para establecer una jerarquía en el contenido. `<h1>` es el más importante y `<h6>` el menos.

```html
<h1>Este es el Título Principal de la Página</h1>
<h2>Este es un Subtítulo Importante</h2>
<h3>Una sección dentro del subtítulo</h3>
<p>Este es un párrafo normal para comparar el tamaño.</p>
<h6>Este es el título menos importante</h6>
```

*Resultado en el navegador:* el texto se mostrará en diferentes tamaños y grosores, indicando su nivel de importancia. `<h1>` será el más grande y `<h6>` el más pequeño.

=== Párrafos, saltos de línea y líneas horizontales
`<p>` para el texto, `<br>` para forzar una nueva línea sin crear un nuevo párrafo, y `<hr>` para una separación visual.

```html
<p>Este es un párrafo de texto. Si quiero forzar un salto de línea justo aquí <br> uso la etiqueta br.</p>
<p>Este párrafo está separado del siguiente por una línea horizontal.</p>
<hr>
<p>Como puedes ver, la línea nos separa visualmente.</p>
```

*Resultado en el navegador:* verás dos párrafos separados por una línea horizontal. En el primer párrafo, el texto saltará a una nueva línea justo después de la palabra "aquí".

=== Formato de texto
Recuerda la diferencia entre semántica (importancia) y pura presentación.

Etiquetas:
- `<strong>` (significado semántico)
- `<em>` (significado semántico)
- `<b>` (sin significado semántico)
- `<i>` (sin significado semántico)

```html
<p>
Este producto es <strong>realmente bueno</strong>, es nuestra recomendación más importante.
Para un énfasis menor, podemos decir que es <em>bastante popular</em> entre nuestros clientes.
Si solo quieres negrita sin significado, usa <b>esto</b>.
Y para cursiva sin significado, usa <i>esto</i>.
</p>
```

*Resultado en el navegador:*
- "realmente bueno" y "esto" aparecerán en *negrita*.
- "bastante popular" y "esto" aparecerán en _cursiva_.

== Contenedores genéricos HTML
En HTML, los *contenedores genéricos* son "cajas" sin ningún significado semántico propio. No le dicen nada al navegador sobre el tipo de contenido que albergan. Su único propósito es agrupar otros elementos para poder aplicarles estilos (con CSS) o manipularlos (con JavaScript).

Existen dos tipos principales de contenedores genéricos: `<div>` y `<span>`. La diferencia entre ellos es la más importante que hay que entender para la maquetación web.

=== div - La caja de bloque
La etiqueta `<div>` (de "división") es un contenedor de *bloque (block).*

*Comportamiento:*
- *Ocupa su propia línea:* siempre empieza en una línea nueva.
- *Ocupa todo el ancho disponible:* por defecto, se estira para ocupar todo el ancho de su contenedor padre, empujando cualquier otro elemento hacia abajo.

*Uso típico:* se utiliza para agrupar secciones grandes de una página. Es la herramienta fundamental para crear el *layout* o la maquetación de un sitio. Por ejemplo, puedes usar un `<div>` para contener una "tarjeta" de producto completa (que a su vez contiene la imagen, un título y un párrafo).

*Ejemplo práctico:* cada `<div>` empieza en una nueva línea, creando dos bloques separados.

```html
<div style="border: 1px solid blue; padding: 10px;">
	<h2>Sección de Noticias</h2>
	<p>Esta es la primera noticia del día.</p>
</div>

<div style="border: 1px solid green; padding: 10px; margin-top: 10px;">
	<h2>Sección de Deportes</h2>
	<p>El equipo local ha ganado el partido.</p>
</div>
```
(El atributo style se usa para añadir bordes y poder visualizar las "cajas" que crea cada `<div>`).


=== span - La etiqueta en línea
La etiqueta `<span>` es un contenedor de *línea (inline).*

*Comportamiento:*
- *No ocupa su propia línea:* se mantiene en la misma línea que el contenido que lo rodea.
- *Ocupa solo el espacio de su contenido:* su ancho es tan grande como el contenido que tiene dentro.

*Uso típico:*  se utiliza para agrupar pequeñas porciones de texto o elementos dentro de un bloque más grande, generalmente para aplicarles un estilo particular o para identificarlos con JavaScript.

*Ejemplo práctico:* `<span>` se aplica a una sola palabra sin romper el flujo del párrafo.

```html
<p>
	EL estado del pedido es:
	<span style="color: green; font-weight: bold;">Entregado</span>.
	Gracias por su compra.
</p>
```
(Aquí, el style se usa para que únicamente la palabra "Entregado" se vea de color verde y en negrita).

=== Cuadro comparativo div vs. span

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Característica*], [`<div>`], [`<span>`],
  ),
  [*Significado semántico*], [Ninguno], [Ninguno],
  [*Comportamiento*], [*Bloque* (ocupa una nueva línea)], [*En línea* (se mantiene en la misma línea)],
  [*Ancho por defecto*], [100% del contenedor padre], [El ancho de su contenido],
  [*Uso típico*], [Agrupar secciones grandes, maquetación], [Agrupar texto o elementos pequeños],
  [*Analogía*], [Caja de cartón para mudanza], [Resaltador de texto],
)

== Etiquetas semánticas
Las *etiquetas semánticas* son aquellas que, además de contener información, describen con precisión el *significado* y el *propósito* de su contenido tanto para el navegador como para el desarrollador. 

El HTML semántico nos permite darle una estructura de significado a una página web para que las máquinas (como los lectores de pantalla para personas con discapacidad visual y los motores de búsqueda como Google) puedan entenderla tan bien como un humano.

=== Principales etiques semánticas
*`<header>`*
- *Propósito:* representa el bloque de introducción o encabezado de una página o de una sección.
- *Piénsalo como:* el membrete de una carta o la cabecera de un periódico.
- *Contenido típico:* el logo del sitio, el título principal (`<h1>`), un eslogan y, muy a menudo, la etiqueta `<nav>` de navegación principal.

```html
<header>
	<img src="/logo.png" alt="Logo de Mi Empresa">
	<nav>
	</nav>
</header>
```

*`<nav>`*
- *Propósito:* contiene los enlaces de navegación principales del sitio.
- *Piénsalo como:* el índice de un libro o el menú principal de un restaurante.
- *Contenido típico:* una lista no ordenada (`<ul>`) de enlaces (`<a>`) a las secciones más importantes de tu sitio web.

```html
<nav>
	<ul>
		<li><a href="/">Inicio</a></li>
		<li><a href="/servicios">Servicios</a></li>
		<li><a href="/contacto">Contacto</a></li>
	</ul>
</nav>
```

*`<main>`*
- *Propósito:* representa el *contenido principal y dominante* del `<body>` de un documento.
- *Piénsalo como:* el capítulo principal que estás leyendo en un libro, excluyendo los encabezados y pies de página.
- *Regla de oro:* solo debe haber *una* etiqueta `<main>` por página y su contenido debe ser único para esa página (no debe incluir cosas que se repiten en todo el sitio, como la navegación o el footer).

*`<section>`*
- *Propósito:* agrupa contenido que tiene una relación temática. Es una sección genérica de un documento
- *Piénsalo como:* un capítulo dentro de un libro o una sección específica de un periódico (Deportes, Finanzas, Cultura).
- *Contenido típico:* casi siempre debe tener un título (`<h2>` - `<h6>`) que defina su tema. Por ejemplo, una sección de "Nuestros Servicios", "Testimonios", o "Planes de Precios".

*`<article>`*
- *Propósito:* contiene una pieza de contenido *independiente y auto-contenido* que podría existir por sí sola y seguiría teniendo sentido.
- *Piénsalo como:* un post en un blog, una noticia en un periódico, un comentario de un usuario o un widget interactivo. Un article podría ser distribuido en otras partes (vía RSS, por ejemplo) y seguiría siendo una unidad completa.
- *Contenido típico:* un título, información sobre el autor, la fecha y el contenido del artículo en sí.

#line(length: 100%)
*¿`<section>` o `<article>`?* Pregúntate: "¿Este contenido tendría sentido si lo publicara en otro sitio web tal cual?". Si la respuesta es sí, probablemente sea un `<article>`. Si solo tiene sentido dentro del contexto de la página actual, es una `<section>`.
#line(length: 100%)

*`<aside>`*
- *Propósito:* contiene información que está indirectamente relacionada con el contenido principal.
- *Piénsalo como:* la *barra lateral (sidebar)* de un blog o las notas al margen de un libro.
- *Contenido típico:* enlaces relacionados, biografías de autor, publicidad, glosarios.

*`<footer>`*
- *Propósito:* representa el pie de página de un documento o de una sección.
- *Piénsalo como:* la parte final de un documento con la "letra pequeña".
- *Contenido típico:* información de copyright, datos de contacto, enlaces a políticas de privacidad, mapa del sitio.

=== Ejemplo de página semántica
```html
<body>
 
  <header>
    <img src="logo.png" alt="Logo del Blog">
    <nav>
      <ul>
        <li><a href="/">Inicio</a></li>
        <li><a href="/recetas">Recetas</a></li>
      </ul>
    </nav>
  </header>
 
  <main>
    <h1>Las Mejores Recetas de Verano</h1>
 
    <article>
      <h2>Ensalada Mediterránea</h2>
      <p>Descripción de la ensalada...</p>
      <section>
        <h3>Ingredientes</h3>
        <p>Lista de ingredientes...</p>
      </section>
      <section>
        <h3>Preparación</h3>
        <p>Pasos de la preparación...</p>
      </section>
    </article>
 
    <aside>
      <h3>Consejos del Chef</h3>
      <p>Para un extra de sabor, añade queso feta.</p>
    </aside>
  </main>
 
  <footer>
    <p>&copy; 2025 Blog de Cocina. Todos los derechos reservados.</p>
  </footer>
 
</body>
```

=== ¿Cuándo usar las etiquetas semánticas?
La regla de oro: *si existe una etiqueta semántica (`<nav>`, `<article>`, `<footer>`, `<button>`, etc)* que describe con precisión tu contenido, úsala.

`<div>` y `<span>` deberían se utilizados como último recurso.

== Comentarios en HTML
Un *comentario* en HTML es un bloque de texto que escribes en tu código pero que el *navegador ignora por completo*. No tiene ningún efecto en cómo se ve o funciona tu página web; su único propósito es ser leído por humanos que estén viendo el código fuente.

Son útiles para dejarte notas a ti mismo o para explicar partes de tu código a otros desarrolladores de tu equipo.

*Sintaxis*

Un comentario en HTML tiene la siguiente forma:
```html
<!-- Comentario de ejemplo -->
```

*Ejemplos de uso práctico*
Los comentarios tienen principalmente dos usos:

1. *Para explicar o dejar notas en el código*

Puedes usar comentarios para aclarar por qué hiciste algo, qué hace una sección compleja del código, o para dejar un recordatorio.

```html
<!-- Este es un comentario de ejemplo. No se mostrará en la página. -->
<p>Este párrafo se mostrará.</p>
```

2. *Para "comentar" o desactivar código temporalmente*

Este es uno de los usos más comunes, especialmente al depurar (buscar errores). En lugar de borrar un bloque de código que podría ser útil más tarde, puedes simplemente "envolverlo" en un comentario. El navegador lo ignorará como si no existiera, pero el código seguirá ahí para cuando lo necesites de nuevo.

```html
<!-- <p>Este párrafo se mostrará.</p> -->
```

== Más etiquetas
=== Listas
==== Listas no ordenadas
Se usan cuando el orden de los elementos no es importante. El navegador las muestra con viñetas.

```html
<h4>Ingredientes para una Ensalada:</h4>
<ul>
  <li>Lechuga</li>
  <li>Tomate</li>
  <li>Pepino</li>
  <li>Queso Feta</li>
</ul>
```
==== Listas ordenadas
Se usan para secuencias o instrucciones donde el orden es crucial. El navegador las numera automáticamente.

```html
<h4>Instrucciones para Desplegar un Proyecto:</h4>
<ol>
  <li>Escribir el código</li>
  <li>Probar la aplicación</li>
  <li>Subir a un repositorio de Git</li>
  <li>Conectar el repositorio a un servicio de hosting</li>
</ol>
```
==== Listas de definición
Son perfectas para glosarios o para presentar pares de término-definición.

- `<dl>`: (Definition List) la envoltura de toda la lista.
- `<dt>`: (Definition Term) el término que se va a definir.
- `<dd>`: (Definition Description) la descripción o definición del término.

```html
<dl>
  <dt>HTML</dt>
  <dd>HyperText Markup Language. El lenguaje para estructurar el contenido de la web.</dd>
  <dt>CSS</dt>
  <dd>Cascading Style Sheets. El lenguaje para diseñar y estilizar el contenido.</dd>
</dl>
```

=== Enlaces
Etiqueta: `<a>`

*Tipos de enlaces:*
- *Absolutos:* apuntan a un sitio web externo. Deben incluir el protocolo completo (https://).

```html
<a href="https://developer.mozilla.org/">Documentación de MDN</a>
```

- *Relativos:* apuntan a otro archivo dentro de tu propio sitio web.

```html
<a href="/paginas/contacto.html">Contacta con nosotros</a>
```

- *De ancla:* apuntan a otra sección dentro de la *misma página*. Primero, le das un id al elemento de destino. Luego, el href del enlace apunta a ese id con una almohadilla (\#).

```html
<a href="#seccion-ofertas">Ir a las ofertas</a>
 
<h2 id="seccion-ofertas">Ofertas Especiales</h2>
```

==== Abrir enlaces en una nueva pestaña

Para que un enlace se abra en una nueva pestaña, se usa el atributo `target="_blank"`. Por seguridad, siempre debe ir acompañado de `rel="noopener noreferrer"`.

```html
<a href="https://externo.com" target="_blank" rel="noopener noreferrer">
  Este sitio se abrirá en una nueva pestaña
</a>
```

=== Imágenes
Etiqueta: `<img>`

Además de `src` y `alt`, puedes usar `width` y `height` para sugerir un tamaño, aunque la forma recomendada de dar estilo es con CSS.

```html
<img src="gatito.jpg" alt="Un gatito jugando con un ovillo" width="300">
```

=== Audio
Etiqueta: `<audio>`

Permite incrustar archivos de sonido. El atributo `controls` es esencial para que el usuario pueda reproducirlo.

```html
<p>Escucha nuestro podcast:</p>
<audio src="/podcasts/episodio-1.mp3" controls>
  Tu navegador no soporta el elemento de audio.
</audio>
```

=== Vídeo
Etiqueta: `<video>`

Permite incrustar archivos de vídeo.
- `controls`: Muestra los controles de reproducción.
- `autoplay` y `muted`: Inician el video automáticamente (generalmente debe estar silenciado para que funcione en los navegadores modernos).
- `loop`: Repite el video en bucle.

```html
<video src="/videos/tutorial.mp4" width="400" controls>
  Tu navegador no soporta el elemento de video.
</video>
```

=== Tablas
Las tablas se usan exclusivamente para *mostrar datos tabulares* (como una hoja de cálculo), no para maquetar la página.
- `<table>`: El contenedor de toda la tabla.
- `<thead>`: La sección del encabezado de la tabla.
- `<tbody>`: El cuerpo principal de la tabla.
- `<tr>` (Table Row): Define una fila.
- `<th>` (Table Header): Define una celda de encabezado (en negrita y centrada por defecto).
- `<td>` (Table Data): Define una celda de datos normal.

```html
<table>
  <thead>
    <tr>
      <th>Producto</th>
      <th>Precio</th>
      <th>Disponibilidad</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Teclado Mecánico</td>
      <td>$120</td>
      <td>En Stock</td>
    </tr>
    <tr>
      <td>Mouse Gamer</td>
      <td>$75</td>
      <td>Agotado</td>
    </tr>
  </tbody>
</table>
```
=== Formularios
Los formularios son la principal vía para recoger información del usuario.
- `<form>`: El contenedor de todos los campos del formulario.
- `action`: La URL del backend a donde se enviarán los datos.
- `method`: El método HTTP a usar (GET para pedir datos, POST para enviar datos de forma segura).
- `<label>`: La etiqueta de texto descriptiva para un campo. Es *vital para la accesibilidad*. Su atributo `for` debe coincidir con el id del `<input>`.
- `<input>`: El campo de entrada. Su atributo `type` define su comportamiento.
- `<textarea>`: Para campos de texto de múltiples líneas.
- `<button type="submit">`: El botón que envía el formulario.

```html
<form action="/enviar-contacto" method="POST">
  <div>
    <label for="nombreUsuario">Nombre:</label>
    <input type="text" id="nombreUsuario" name="nombre" required>
  </div>
  <div>
    <label for="emailUsuario">Email:</label>
    <input type="email" id="emailUsuario" name="email" required>
  </div>
  <div>
    <label for="mensajeUsuario">Mensaje:</label>
    <textarea id="mensajeUsuario" name="mensaje" rows="5" required></textarea>
  </div>
  <button type="submit">Enviar Mensaje</button>
</form>
```

= CSS

== ¿Qué es CSS (Cascading Style Sheets)?

CSS, que significa Hojas de Estilo en Cascada, es el lenguaje que usamos para describir la presentación de un documento HTML. En resumen, CSS le dice al navegador cómo deben verse los elementos HTML.

Si HTML es el esqueleto (`<h1>`, `<p>`, `<div>`), CSS es todo lo visual:

- El color del texto y del fondo.
- El tamaño y la fuente de la letra.
- El espaciado entre elementos.
- La posición de los elementos en la página (el layout).
- Las animaciones y transiciones.

== ¿Cómo se Conecta CSS con HTML?

Existen tres formas de aplicar estilos a un documento HTML, pero una de ellas es la práctica profesional recomendada.

1. *Estilos en Línea (Inline Styles):* Se aplican directamente a una etiqueta HTML usando el atributo style.

```html
<p style="color: blue; font-size: 20px;">Este párrafo será azul y grande.</p>
```
*Veredicto: 👎 Mala práctica*. Es difícil de mantener, mezcla la estructura con la presentación y no es reutilizable. Se usa solo en casos muy específicos, a menudo con JavaScript.

2. *Estilos Internos (Internal Styles):* Se escriben dentro de una etiqueta `<style>` en el `<head>` del documento HTML.

```html
<head>
  <style>
    p {
      color: green;
    }
  </style>
</head>
<body>
  <p>Todos los párrafos de esta página serán verdes.</p>
</body>
```
*Veredicto: 👍 Mejor, pero no ideal*. Es útil para estilos que solo aplican a una única página, pero sigues mezclando el CSS dentro del archivo HTML.

3. *Estilos Externos (External Styles) - ✅ ¡La Forma Correcta!* Creamos un archivo separado con la extensión .css (ej: estilos.css) y lo enlazamos desde nuestro HTML. Esta es la práctica estándar y profesional.

*estilos.css:*
```css
p {
  color: red;
}
```
*index.html:*
```html
<head>
  <link rel="stylesheet" href="estilos.css">
</head>
<body>
  <p>Este párrafo será rojo, definido desde un archivo externo.</p>
</body>
```
*Veredicto: ✅ La mejor práctica*. Mantiene los archivos organizados (separación de intereses), permite reutilizar la misma hoja de estilos en múltiples páginas y facilita enormemente el mantenimiento del sitio.

== La sintaxis de CSS: selector y declaración
Una regla de CSS se compone de dos partes principales:

- *Selector:* Apunta al elemento o elementos HTML que quieres estilizar.
- *Bloque de Declaración:* Envuelto en llaves {}, contiene una o más declaraciones.
- *Declaración:* Una sola regla de estilo, compuesta por una *propiedad* (ej: color) y un *valor* (ej: blue), separados por dos puntos (:) y terminando con un punto y coma (;).

=== Selectores: el corazón del poder de CSS
Los selectores son los patrones que usamos para "seleccionar" los elementos a los que queremos aplicar estilos.

==== Selectores Básicos
- *Por Tipo/Etiqueta:* Selecciona todos los elementos de un tipo.
```css
/* Todos los párrafos serán color gris */
p { color: grey; }
```

- *Por Clase:* Selecciona todos los elementos que tengan un atributo class específico. Es el selector más versátil y usado. Se identifica con un punto (.).
```css
/* Todos los elementos con class="destacado" serán naranjas */
.destacado { color: orange; }
```

- *Por ID:* Selecciona un único elemento que tenga un atributo id específico. El ID debe ser único en toda la página. Se identifica con una almohadilla (\#).
```css
/* El elemento con id="titulo-principal" será azul marino */
#titulo-principal { color: navy; }
```

==== Selector de Atributos
Selecciona elementos basándose en sus atributos. Es muy útil para formularios.
```css
/* Selecciona todos los inputs que sean de tipo "text" */
input[type="text"] {
  border: 1px solid #ccc;
}
```

==== Selectores combinados (anidados)
Permiten seleccionar elementos basándose en su relación con otros en el DOM.

- *Descendente ():* Selecciona un elemento que está dentro de otro, sin importar la profundidad.
```css
/* Selecciona cualquier <a> que esté dentro de un <li> */
li a { text-decoration: none; }
```

- *Hijo Directo (>):* Selecciona un elemento que es hijo inmediato de otro.
```css
/* Selecciona solo los <li> que son hijos directos de un <ul> con la clase "menu-principal" */
.menu-principal > li { border-bottom: 1px solid black; }
```

- *Hermano Adyacente (+):* Selecciona un elemento que está inmediatamente después de otro.
```css
/* Selecciona el primer párrafo que viene justo después de un h2 */
h2 + p { font-style: italic; }
```

==== Selectores múltiples (agrupamiento)
Para aplicar el mismo estilo a diferentes selectores sin repetir código, simplemente sepáralos por una coma (,).
```css
/* Aplica el color púrpura y la misma fuente a los h1, h2 y h3 */
h1, h2, h3 {
  color: purple;
  font-family: 'Arial', sans-serif;
}
```
Dominar los selectores te da el poder de apuntar con precisión a cualquier elemento de tu página para darle el estilo exacto que deseás.

== Tipografía
La tipografía es un elemento de diseño crucial. Un buen manejo del texto puede hacer que tu sitio pase de ser amateur a profesional.

Aquí tenés las propiedades de texto más importantes:
- *color:* Define el color del texto.
- *font-family:* Define el tipo de letra (fuente) que se usará. Es una buena práctica proveer una "pila de fuentes" (Font stack) como respaldo. El navegador intentará usar la primera, si no la encuentra, pasará a la siguiente, y así sucesivamente.
- *font-size:* Controla el tamaño del texto. Puedes usar px (píxeles) para un tamaño fijo o rem para un tamaño relativo al elemento raíz, lo cual es mejor para la escalabilidad y accesibilidad.
- *font-weight:* Define el grosor del texto. Los valores más comunes son normal (o 400) y bold (o 700).
- *text-align:* Alinea el texto horizontalmente dentro de su contenedor. Los valores pueden ser left, right, center o justify.
- *text-decoration:* Añade o quita líneas decorativas al texto. Su uso más común es quitar el subrayado que los navegadores ponen por defecto a los enlaces.

*Ejemplo práctico*

```css
.titulo-principal {
  color: #2c3e50; /* Un azul oscuro */
  font-family: 'Helvetica', Arial, sans-serif;
  font-size: 3rem; /* 3 veces el tamaño de fuente base */
  font-weight: bold;
  text-align: center;
}

.enlace-sin-subrayado {
  text-decoration: none;
  color: #e74c3c; /* Un rojo anaranjado */
}
```

== Modelo de cajas (box model)
Este es *el concepto más importante* para entender el layout en CSS. El navegador trata a *cada elemento HTML como si fuera una caja rectangular*. Esta caja se compone de cuatro partes, como si fuera un cuadro enmarcado:

1. *Content (Contenido):* El contenido real del elemento (texto, una imagen, etc.).
2. *Padding (Relleno):* Un espacio transparente entre el contenido y el borde. Es el "aire" o "espacio para respirar" del contenido dentro de su caja.
3. *Border (Borde):* La línea que rodea al padding y al contenido. Es el "marco" del cuadro.
4. *Margin (Margen):* Un espacio transparente fuera del borde. Es el espacio que separa esta caja de las cajas de otros elementos. Es el "espacio personal" del elemento.

*Propiedades en CSS:*

- *padding:* Controla el relleno. Puedes definir los 4 lados a la vez (padding: 10px;) o individualmente (padding-top, padding-left, etc.).
- *border:* Controla el borde. La forma corta es border: [grosor] [estilo] [color]; (ej: border: 1px solid black;).
- *margin:* Controla el margen exterior. Funciona igual que padding.

*Ejemplo Práctico:*

```css
.tarjeta-producto {
  width: 300px;
  padding: 20px; /* 20px de espacio en todos los lados, por dentro */
  border: 1px solid #ddd; /* Un borde gris claro */
  margin: 15px; /* 15px de espacio separándolo de otros elementos */
}
```

=== El "arreglo mágico": box-sizing: border-box;

Por defecto, el navegador calcula el tamaño de una caja de una forma poco intuitiva. Si defines width: 300px; y luego añades padding: 20px;, el ancho total de la caja en pantalla será 300px + 20px (izq) + 20px (der) = 340px. ¡Esto hace que los cálculos de layout sean una pesadilla!

Afortunadamente, hay una solución simple que la mayoría de los desarrolladores aplican a todos sus proyectos.

La propiedad *box-sizing: border-box;* le dice al navegador: "Cuando yo defina un width de 300px, quiero que la caja mida *exactamente 300px en total*, incluyendo el borde y el padding. Si añades padding, reduce el espacio del contenido para compensar".

Es una práctica estándar aplicar esta regla a *todos los elementos* al principio de tu archivo CSS.

=== El "reseteo" universal
```css
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
```
- El selector universal (\*) apunta a cada elemento de la página.
- margin: 0; y padding: 0; eliminan los márgenes y rellenos que los navegadores aplican por defecto, dándote un control total sobre el espaciado desde el principio.

== Diseño web adaptable (responsive web design)
El *Diseño Responsivo* es una filosofía y un conjunto de técnicas que permiten que el layout y el contenido de una página web se adapten y se reorganicen automáticamente para ofrecer una experiencia de visualización óptima en cualquier tamaño de pantalla.

=== El primer paso esencial: la meta etiqueta viewport
Para que el diseño responsivo funcione, lo primero que debemos hacer es añadir una etiqueta `<meta>` específica dentro del `<head>` de nuestro archivo HTML. Sin esta línea, los navegadores móviles intentarán mostrar la versión de escritorio de tu sitio, pero muy alejada, resultando en texto ilegible.

*Añade siempre esta línea a tus proyectos:*
```html
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
```
- width=device-width: Le dice al navegador que el ancho de la "ventana de visualización" (viewport) debe ser igual al ancho de la pantalla del dispositivo.
- initial-scale=1.0: Establece el nivel de zoom inicial al 100%, sin alejar ni acercar el contenido.

=== Diseño fluido: de píxeles fijos a porcentajes flexibles
Usar unidades fijas como width: 960px; es el enemigo del diseño responsivo. La clave para que un diseño sea "fluido" es usar *unidades relativas*, principalmente los porcentajes (%).

Un ancho en porcentaje se calcula en base al *ancho de su elemento padre*.

*Ejemplo:*
```css
.contenedor-padre {
  width: 800px; /* Ancho fijo */
}
 
.caja-hija {
  width: 50%; /* 50% de 800px = 400px */
}
```
Si el contenedor-padre cambiara su ancho, la caja-hija se adaptaría automáticamente para seguir ocupando el 50% del nuevo espacio. Esto es fundamental para las imágenes. Una técnica muy común es:
```css
img {
  max-width: 100%;
  height: auto;
}
```
Esto asegura que una imagen nunca será más ancha que su contenedor, evitando que "rompa" el layout en pantallas pequeñas.

=== Media queries: las reglas del juego
Las *Media Queries* son la herramienta más poderosa del diseño responsivo. Son como "condicionales if" para tu CSS. Te permiten aplicar un bloque de estilos solo si se cumple una condición específica sobre el dispositivo, generalmente el ancho de la pantalla.

*Sintaxis básica:*
```css
@media (condición) {
  /* ... las reglas de CSS aquí dentro solo se aplicarán si la condición es verdadera ... */
}
```
La condición más común es sobre el ancho de la pantalla. Los puntos en los que el diseño cambia se llaman "*breakpoints*" (puntos de ruptura).

*Ejemplo práctico:  Una Columna en Móvil, Dos en Escritorio.* Imagina que tenemos dos cajas que queremos que se apilen en un teléfono pero que estén una al lado de la otra en una pantalla más grande. La práctica moderna es diseñar para "*Mobile First*" (primero móvil).

*HTML*
```html
<div class="contenedor">
  <div class="caja">Caja 1</div>
  <div class="caja">Caja 2</div>
</div>
```

*CSS*
```css
/* --- Estilos base (para móvil y todas las pantallas) --- */
.contenedor {
  display: flex;
  flex-direction: column; /* Por defecto, apila los elementos verticalmente */
  gap: 10px;
}
 
.caja {
  background-color: #3498db;
  padding: 20px;
  color: white;
}
 
/* --- Media Query para pantallas más grandes (el breakpoint es 768px) --- */
@media (min-width: 768px) {
  .contenedor {
    flex-direction: row; /* Cuando la pantalla mida 768px o más, las cajas se ponen en fila */
  }
}
```
Aquí, los estilos base son para la vista móvil. La media query con min-width: 768px añade las reglas para pantallas de tablet y escritorio, sobreescribiendo lo necesario.

=== Unidades de viewport: vw y vh
Además de los porcentajes, existen otras unidades relativas muy útiles que se basan en el tamaño del viewport (la ventana del navegador).

- vw (Viewport Width): 1vw es igual al 1% del ancho del viewport.
- vh (Viewport Height): 1vh es igual al 1% de la altura del viewport.

Son extremadamente útiles para crear secciones que deben ocupar toda la pantalla.

*Ejemplo:*
```css
.hero-banner {
  width: 100vw; /* Ocupa el 100% del ancho de la ventana */
  height: 100vh; /* Ocupa el 100% de la altura de la ventana */
  background-color: #2c3e50;
  color: white;
  display: flex;
  justify-content: center;
  align-items: center;
}
```

= JavaScript
== ¿Qué es JavaScript?
JavaScript es un *lenguaje de programación* que nos permite crear contenido dinámico, controlar multimedia, animar elementos y, en general, hacer que nuestras páginas web sean interactivas. A diferencia de HTML y CSS que son lenguajes declarativos (describen cómo es algo), JavaScript es un lenguaje imperativo (da órdenes y ejecuta lógica).

== ¿Cómo se inserta JavaScript en HTML?
Al igual que con CSS, existen tres formas de incluir JavaScript en un documento HTML, pero una es la práctica recomendada por su organización y eficiencia.

1. *JavaScript en Línea (Inline):* Se escribe directamente en un atributo de una etiqueta HTML, como onclick.
```html
<button onclick="alert('¡Hiciste clic!');">Púlsame</button>
```

2. *JavaScript Interno:* Se escribe dentro de una etiqueta <script> en el propio archivo HTML. La práctica recomendada es colocar esta etiqueta justo *antes del cierre de la etiqueta `</body>`.*
```html
<body>
  <h1>Mi Página</h1>
  <script>
    alert('¡La página se ha cargado!');
  </script>
</body>
```
*¿Por qué al final?* Porque asegura que todo el contenido HTML de la página ya ha sido cargado por el navegador. De esta forma, tu script puede acceder y manipular cualquier elemento sin riesgo de que aún no exista.

3. *JavaScript Externo - ✅ ¡La Forma Correcta!:* Creamos un archivo separado con la extensión .js (ej: app.js) y lo enlazamos desde el HTML. Esta es la forma profesional y organizada de trabajar.

*app.js*
```js
console.log('¡Mi script externo está funcionando!');
```

*index.html:* Se enlaza de la misma forma que un script interno, pero usando el atributo src (source). Y sí, también se coloca justo antes de `</body>`.
```html
<body>
  <script src="app.js"></script>
</body>
```
*Veredicto: ✅ La mejor práctica.* Mantiene tu código limpio, separado, reutilizable y mucho más fácil de gestionar a medida que el proyecto crece.

== Consola del navegador
La *consola* es una herramienta fundamental para cualquier desarrollador de JavaScript. Es una ventana dentro de las "Herramientas de Desarrollador" de tu navegador (puedes abrirla con F12 o clic derecho > Inspeccionar > Consola) donde puedes ver mensajes de error, registrar información y depurar tu código.

El comando más importante que usarás miles de veces es console.log(). Sirve para "imprimir" cualquier valor en la consola y así verificar qué está pasando en tu código.

*app.js*
```js
console.log('Hola, consola!');
console.log(5 + 3); // Imprimirá 8 en la consola
```

== Variables y constantes
Para poder realizar tareas, un programa necesita guardar información en la memoria. Para esto usamos *variables y constantes*. Piensa en ellas como cajas etiquetadas donde guardamos datos.

=== Variables con let
Una variable declarada con let es una "caja" cuyo contenido *puede cambiar* a lo largo del tiempo. Es la forma moderna de declarar variables que necesitan ser reasignadas.
```js
let edad = 18;
console.log("Edad inicial:", edad); // Muestra: Edad inicial: 18
 
edad = 19; // El valor de la caja ha cambiado
console.log("Edad actualizada:", edad); // Muestra: Edad actualizada: 19
```

=== Constantes con const
Una constante declarada con const es una "caja" que, una vez que le pones algo dentro, *no puedes volver a cambiar su contenido*. Su valor es constante.

Es una *buena práctica usar const por defecto* para todo, y solo cambiar a let si sabes con seguridad que necesitarás reasignar esa variable. Esto hace tu código más seguro y predecible.

```js
const NOMBRE_USUARIO = "JotaMuebles";
console.log(NOMBRE_USUARIO); // Muestra: JotaMuebles
 
// Si intentas hacer esto, obtendrás un error en la consola ¡y eso es bueno!
// NOMBRE_USUARIO = "OtroNombre"; // TypeError: Assignment to constant variable.
```
_(Nota histórica: Antes se usaba var para declarar variables. Aunque lo verás en código antiguo, la práctica moderna prefiere let y const porque tienen un comportamiento más predecible y seguro)._

== Tipos de datos
=== Tipos de datos primitivos
==== String (cadena de texto)
Se usa para cualquier tipo de texto. Se puede escribir con comillas simples (' '), dobles (" ") o comillas invertidas (\`).
```js
const nombreMuebleria = "Mueblería Jota";
let saludo = '¡Bienvenido!';
// Las comillas invertidas permiten interpolar variables:
let mensajeCompleto = `${saludo} Visita ${nombreMuebleria}.`; 
console.log(mensajeCompleto); // Muestra: ¡Bienvenido! Visita Mueblería Jota.
```

==== Number (número)
Se usa para cualquier tipo de número, ya sean enteros o con decimales.
```js
const cantidadDeSillas = 4;
let precio = 150.99;
```

==== Boolean (booleano)
Representa un valor lógico y solo puede ser true (verdadero) o false (falso). Es la base para tomar decisiones en nuestro código.
```js
const clienteEsRegistrado = true;
let hayStock = false;
```

==== undefined
Representa una variable que ha sido declarada pero a la que *aún no se le ha asignado un valor*. Es la "caja vacía" por defecto.
```js
let direccionDelCliente;
console.log(direccionDelCliente); // Muestra: undefined
```

==== null
Representa la *ausencia intencional* de un valor. Es diferente de undefined porque aquí, el programador ha puesto la "caja vacía" a propósito.
```js
let telefonoSecundario = null; // El usuario no proveyó un segundo teléfono.
```
_(Existen otros tipos primitivos como BigInt y Symbol, pero son de uso más avanzado)._

== Operadores
Los operadores nos permiten manipular nuestras variables y valores.

=== Operadores aritméticos
Son los operadores matemáticos que ya conoces.
- + Suma (y también concatena strings)
- - Resta
- \* Multiplicación
- \/ División
- % Módulo (devuelve el resto de una división)

```js
let totalProductos = 5 + 3; // totalProductos es 8
let nombreCompleto = "Juan" + " " + "Pérez"; // nombreCompleto es "Juan Pérez"
let resto = 10 % 3; // resto es 1 (porque 10/3 = 3 y sobra 1)
```

=== Operadores de comparación
Se usan para comparar dos valores y *siempre devuelven un booleano* (true o false).

- > Mayor que
- < Menor que
- >= Mayor o igual que
- <= Menor o igual que
- \=== *Estrictamente Igual a*
- !== *Estrictamente Desigual a*

==== ¡Muy importante! == vs ===
- \== (igualdad suelta): Compara solo el valor, intentando convertir los tipos. '5' == 5 devuelve true, lo cual puede causar errores inesperados.
- \=== (igualdad estricta): Compara tanto el *valor como el tipo*. '5' === 5 devuelve false.

*Regla de Oro:* Usa siempre la comparación estricta (=== y !==) para evitar comportamientos extraños y hacer tu código más seguro.

=== Operadores lógicos
Se usan para combinar expresiones booleanas.

- && (AND / Y Lógico): Devuelve true solo si *ambas* condiciones son verdaderas.
- || (OR / O Lógico): Devuelve true si *al menos una* de las condiciones es verdadera.
- ! (NOT / No Lógico): Invierte el valor booleano (!true es false).

```js
let esAdulto = true;
let tieneLicencia = false;
 
// Para conducir, necesita ser adulto Y tener licencia
let puedeConducir = esAdulto && tieneLicencia; // Resultado: false
 
// Para entrar al cine, solo necesita ser adulto O ir con un representante
let puedeEntrarAlCine = esAdulto || tieneLicencia; // Resultado: true
```

== Primeras interacciones con el usuario
JavaScript nos da tres funciones muy simples para interactuar directamente con el usuario a través de ventanas emergentes del navegador. Son excelentes para aprender y hacer pruebas rápidas, aunque no se usan en aplicaciones profesionales modernas.

=== alert()
Muestra un mensaje simple al usuario. El usuario solo puede hacer clic en "Aceptar".
```js
alert('¡Oferta especial en todos los sofás!');
```

=== prompt()
Muestra un mensaje y un campo de texto para que el usuario ingrese información. Devuelve el texto ingresado como un string o null si el usuario presiona "Cancelar".
```js
const nombreUsuario = prompt('Por favor, ingresa tu nombre:');
alert('Hola, ' + nombreUsuario);
```

=== confirm()
Muestra un mensaje con dos botones: "Aceptar" y "Cancelar". Devuelve true si el usuario acepta o false si cancela.
```js
const deseaRecibirNoticias = confirm('¿Te gustaría recibir nuestro boletín de noticias?');
 
if (deseaRecibirNoticias === true) {
  console.log('El usuario se ha suscrito.');
} else {
  console.log('El usuario no quiso suscribirse.');
}
```

== Estructuras de control
=== Estructuras de control condicionales
==== if / else
La estructura if (si) es la forma más básica de toma de decisiones. Permite ejecutar un bloque de código solo si una condición es true.

Se puede complementar con else if (si no, si...) para evaluar múltiples condiciones y con else (si no) para ejecutar un código si ninguna de las condiciones anteriores se cumple.

*Sintaxis:*
```js
if (condicion) {
  // Este bloque de código se ejecuta si la condición es verdadera.
} else if (otraCondicion) {
  // Este bloque se ejecuta si la primera condición es falsa, pero esta es verdadera.
} else {
  // Este bloque se ejecuta si ninguna de las condiciones anteriores es verdadera.
}
```

*Ejemplo Práctico en "Mueblería Jota":* Vamos a determinar el estado del stock de un producto.
```js
let stockDeSillas = 12;
 
if (stockDeSillas > 20) {
  console.log("Stock alto: Hay muchas sillas disponibles.");
} else if (stockDeSillas > 0) {
  console.log("Stock bajo: ¡Quedan pocas unidades, aprovecha!");
} else {
  console.log("Agotado: No hay sillas disponibles por el momento.");
}
// Resultado en la consola: "Stock bajo: ¡Quedan pocas unidades, aprovecha!"
```

=== Estructuras de control iterativas (bucles)
Los bucles o "loops" nos permiten ejecutar un bloque de código múltiples veces sin tener que escribirlo una y otra vez.

==== Bucle for
Se usa cuando sabes de antemano *cuántas veces* quieres que se repita una acción.

*Sintaxis:* `for (inicialización; condición; actualización)`

+ *Inicialización:* Se ejecuta una sola vez, al principio. Generalmente se declara una variable contador (let i = 0).
+ *Condición:* El bucle se ejecutará mientras esta condición sea true.
+ *Actualización:* Se ejecuta al final de cada repetición. Generalmente se incrementa el contador (i++).

*Ejemplo:* Mostrar una línea de producto 3 veces.
```js
for (let i = 1; i <= 3; i++) {
  console.log("Mostrando silla de comedor modelo #" + i);
}
// Resultado en la consola:
// Mostrando silla de comedor modelo #1
// Mostrando silla de comedor modelo #2
// Mostrando silla de comedor modelo #3
```

==== Bucle while
Se usa cuando quieres que una acción se repita *mientras una condición sea verdadera*, sin saber necesariamente cuántas veces ocurrirá.

*¡Cuidado!* Debes asegurarte de que algo dentro del bucle haga que la condición eventualmente se vuelva false, o crearás un bucle infinito que bloqueará tu programa.

*Ejemplo:* Simular el ensamblaje de un mueble hasta que esté completo.
```js
let piezasEnsambladas = 0;
const piezasTotales = 5;
 
while (piezasEnsambladas < piezasTotales) {
  piezasEnsambladas++; // En cada repetición, ensamblamos una pieza.
  console.log("Ensamblando pieza " + piezasEnsambladas + " de " + piezasTotales);
}
 
console.log("¡Mueble ensamblado con éxito!");
```

== Funciones
Una *función* es un bloque de código reutilizable diseñado para realizar una tarea específica. En lugar de escribir la misma lógica una y otra vez, la "empaquetamos" en una función y la "llamamos" cada vez que la necesitemos.

=== Declarar y Llamar a una Función
- *Declarar:* Se usa la palabra clave function, seguida de un nombre y paréntesis (). Dentro de los paréntesis van los parámetros, que son como variables placeholder para los datos que la función necesitará.
- *Llamar (o Invocar):* Se escribe el nombre de la función seguido de paréntesis. Dentro, se pasan los argumentos, que son los valores reales para los parámetros.

=== Retornar valores (return)
Las funciones no solo hacen cosas, también pueden calcular un valor y "devolverlo". La palabra clave return finaliza la ejecución de la función y devuelve el valor especificado.

=== Ejemplo Práctico: Una función para calcular el precio con IVA.
```js
// 1. Declaramos la función con dos parámetros: precio y tasaDeImpuesto
function calcularPrecioFinal(precioBase, tasaDeImpuesto) {
  const impuesto = precioBase * tasaDeImpuesto;
  const precioTotal = precioBase + impuesto;
  return precioTotal; // 3. La función devuelve el resultado del cálculo
}
 
// 2. Llamamos a la función con dos argumentos reales
const precioMesa = 500;
const iva = 0.21;
 
const precioFinalMesa = calcularPrecioFinal(precioMesa, iva);
 
console.log("El precio final de la mesa es: $" + precioFinalMesa); 
// Resultado en la consola: El precio final de la mesa es: $605
```