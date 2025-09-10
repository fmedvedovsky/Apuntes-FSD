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

=== Declarar y llamar a una función
- *Declarar:* Se usa la palabra clave function, seguida de un nombre y paréntesis (). Dentro de los paréntesis van los parámetros, que son como variables placeholder para los datos que la función necesitará.
- *Llamar (o Invocar):* Se escribe el nombre de la función seguido de paréntesis. Dentro, se pasan los argumentos, que son los valores reales para los parámetros.

=== Retornar valores (return)
Las funciones no solo hacen cosas, también pueden calcular un valor y "devolverlo". La palabra clave return finaliza la ejecución de la función y devuelve el valor especificado.

=== Ejemplo práctico: una función para calcular el precio con IVA.
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

== Arrays
=== ¿Qué es un array?
Piensa en un array como una estantería con casilleros numerados. Es una única "variable" que funciona como una colección ordenada, capaz de guardar múltiples valores en su interior. Cada valor ocupa un "casillero" con un número específico, lo que nos permite acceder a él fácilmente.

=== Creando y accediendo a los elementos de un array
==== Creación
La forma más común de crear un array en JavaScript es usando corchetes [].

```js
// Un array de strings (texto)
const catalogoMuebles = ['Silla de Comedor', 'Mesa de Centro', 'Sofá de 3 Cuerpos', 'Estantería'];
 
// Un array de numbers (números)
const precios = [4500, 25000, 80000, 12000];
 
// Un array puede contener tipos de datos mixtos, aunque es menos común.
const datosProducto = ['Silla Ergonómica', 4.8, true]; // nombre, rating, hayStock
```

==== Acceso a elementos: el índice base cero
Para acceder a un elemento específico del array (un "casillero" de la estantería), usamos su *índice* entre corchetes.

*¡Concepto Clave!* En JavaScript, como en muchos otros lenguajes, los índices de los arrays *empiezan en 0*. El primer elemento está en el índice 0, el segundo en el 1, y así sucesivamente.

```js
console.log(catalogoMuebles[0]); // Muestra: 'Silla de Comedor'
console.log(catalogoMuebles[2]); // Muestra: 'Sofá de 3 Cuerpos'
 
// También podemos modificar un elemento usando su índice
catalogoMuebles[1] = 'Mesa de Roble';
console.log(catalogoMuebles); // El segundo elemento ahora es 'Mesa de Roble'
```

=== Propiedad .length
Para saber cuántos elementos hay en un array, usamos la propiedad .length.
```js
console.log(catalogoMuebles.length); // Muestra: 4
```
*Truco útil:* El índice del último elemento de un array es siempre ```array.length - 1```.

=== Métodos comunes para manipular arrays
Los arrays vienen con "superpoderes" incorporados llamados *métodos*, que son funciones para manipular su contenido. Estos son los más básicos:

_Estos métodos modifican el array original._

==== Añadir elementos
- *.push(elemento):* Añade un elemento al *final* del array.
```js
precios.push(5500); // Añade 5500 al final
console.log(precios); // Muestra: [4500, 25000, 80000, 12000, 5500]
```
- *.unshift(elemento):* Añade un elemento al *principio* del array.
```js
precios.unshift(1000); // Añade 1000 al principio
console.log(precios); // Muestra: [1000, 4500, 25000, 80000, 12000, 5500]
```

==== Quitar elementos
- *.pop():* Elimina el *último* elemento del array y lo devuelve.
```js
const precioEliminado = precios.pop();
console.log(precioEliminado); // Muestra: 5500
console.log(precios); // El 5500 ya no está en el array
```
- *.shift():* Elimina el *primer* elemento del array y lo devuelve.
```js
const primerPrecio = precios.shift();
console.log(primerPrecio); // Muestra: 1000
console.log(precios); // El 1000 ya no está en el array
```

=== Recorriendo arrays (Iteración)
Es muy común necesitar realizar una acción para cada uno de los elementos de un array. A esto se le llama *iterar*.

==== La forma clásica: bucle for
Podemos combinar un bucle for con la propiedad .length para recorrer el array.
```js
const listadoDeMuebles = ['Silla', 'Mesa', 'Cama'];
 
for (let i = 0; i < listadoDeMuebles.length; i++) {
  console.log('Producto encontrado: ' + listadoDeMuebles[i]);
}
// Resultado en la consola:
// Producto encontrado: Silla
// Producto encontrado: Mesa
// Producto encontrado: Cama
```

==== La forma moderna y recomendada: .forEach()
Los arrays tienen un método .forEach() que hace la iteración más limpia y legible. Recibe una función como argumento, la cual se ejecutará para cada elemento del array.
```js
const listadoDeMuebles = ['Silla', 'Mesa', 'Cama'];
 
listadoDeMuebles.forEach(function(mueble, indice) {
  console.log(`Índice ${indice}: ${mueble}`);
});
 
// Usando la sintaxis moderna de "arrow function" (función flecha)
listadoDeMuebles.forEach((mueble, indice) => {
  console.log(`Índice ${indice}: ${mueble}`);
});
```
forEach es menos propenso a errores (no tienes que manejar el contador i) y deja más claro lo que intentas hacer: "para cada mueble, haz esto".

== DOM
=== ¿Qué es el DOM (Document Object Model)?
Cuando un navegador carga un documento HTML, no lo lee como un simple texto. Lo convierte en una estructura de datos en memoria, una representación en forma de árbol. A este "árbol" vivo y modificable se le llama *DOM (Modelo de Objetos del Documento)*.

*Analogía:* Si tu archivo .html es el *plano* de una casa, el DOM es una *maqueta 3D interactiva* de esa casa que el navegador construye. Cada etiqueta, atributo y texto del plano se convierte en un "objeto" o "nodo" en la maqueta.

JavaScript no modifica el archivo .html original; modifica esta maqueta interactiva, y el navegador actualiza instantáneamente lo que el usuario ve para que coincida con los cambios en la maqueta. El punto de entrada para acceder a todo el DOM en JavaScript es el objeto global document.

=== Seleccionar elementos del DOM
Para poder cambiar algo, primero tenemos que "agarrarlo". JavaScript nos da varios métodos para seleccionar elementos del DOM.

==== La forma moderna y recomendada: querySelector
Estos métodos son los más potentes y versátiles porque utilizan la misma sintaxis de *selectores CSS* que ya conoces.

- *document.querySelector(selectorCSS):* Devuelve el *primer* elemento que coincide con el selector especificado. Si no encuentra nada, devuelve null.
```js
// Seleccionar el elemento con el ID 'titulo-principal'
const tituloPrincipal = document.querySelector('#titulo-principal');
 
// Seleccionar el primer elemento con la clase 'item-destacado'
const itemDestacado = document.querySelector('.item-destacado');
 
// Seleccionar el primer <a> dentro de un <li>
const primerLink = document.querySelector('li a');
```

- *document.querySelectorAll(selectorCSS):* Devuelve *todos* los elementos que coinciden con el selector, en una colección especial llamada NodeList que se puede recorrer como un array.
```js
// Seleccionar todos los párrafos dentro de un <article>
const todosLosParrafos = document.querySelectorAll('article p');
 
// Ahora podemos iterar sobre ellos
todosLosParrafos.forEach(parrafo => {
  parrafo.style.lineHeight = '1.6'; // Aumentamos el interlineado de cada párrafo
});
```
_(Existen métodos más antiguos como getElementById, getElementsByClassName, etc., pero querySelector y querySelectorAll son generalmente preferidos por su flexibilidad)._

=== Manipular los elementos seleccionados
Una vez que hemos guardado un elemento en una variable, podemos hacer todo tipo de cosas con él.

- *Cambiar el Contenido: .textContent:* Cambia solo el texto de un elemento. Es la forma más segura.
```js
tituloPrincipal.textContent = 'Mueblería Jota - ¡Nuevos Productos!';
```
- *.innerHTML:* Permite insertar HTML crudo. Es más potente pero *peligroso* si se usa con texto proveniente del usuario, ya que puede exponer tu sitio a ataques (XSS).

- *Cambiar Estilos:* Se accede a través de la propiedad style. Las propiedades CSS con guion (ej: background-color) se escriben en camelCase (ej: backgroundColor).
```js
tituloPrincipal.style.color = 'navy';
tituloPrincipal.style.backgroundColor = '#f1f1f1';
```

*Trabajar con Clases CSS:* La propiedad classList nos da métodos para manejar clases de forma segura.
- *.add('nombre-clase'):* Añade una clase.
- *.remove('nombre-clase'):* Quita una clase.
- *.toggle('nombre-clase'):* La añade si no la tiene, o la quita si ya la tiene. ¡Perfecto para un botón de modo oscuro!
```js
const menu = document.querySelector('#menu-mobile');
menu.classList.add('abierto');
```

=== Crear y añadir nuevos elementos
También podemos crear elementos HTML desde cero y añadirlos a la página.

*El flujo:*
+ *Crear el elemento:* document.createElement('nombreEtiqueta')
+ *Añadirle contenido:* Usando .textContent o .innerHTML.
+ *Añadirlo al DOM:* Usando elementoPadre.appendChild(elementoHijo).

*Ejemplo:* Añadir un nuevo mueble a una lista existente.

```js
// 1. Seleccionamos el contenedor padre (la lista <ul>)
const listaCatalogo = document.querySelector('#lista-de-muebles');
 
// 2. Creamos el nuevo elemento <li> en memoria
const nuevoMueble = document.createElement('li');
 
// 3. Le damos contenido
nuevoMueble.textContent = 'Sofá Cama';
nuevoMueble.classList.add('nuevo-item'); // ¡También le podemos añadir clases!
 
// 4. Lo añadimos al final de la lista <ul>
listaCatalogo.appendChild(nuevoMueble);
```

=== Escuchando eventos del emailUsuario
La manipulación del DOM se vuelve realmente poderosa cuando responde a las acciones del usuario. Para esto, "escuchamos" eventos.

El método *addEventListener()* es la forma moderna de hacerlo. Recibe dos argumentos principales: el *nombre del evento* (como un string) y la *función que se ejecutará* cuando ocurra el evento.

*Ejemplo:* Hacer que un botón muestre un mensaje al ser clickeado.

```js
const botonComprar = document.querySelector('#btn-comprar');
 
botonComprar.addEventListener('click', function() {
  alert('¡Gracias por tu interés! Producto añadido al carrito.');
});
```

== Asincronía
=== Callbacks
Un *callback* es una función que se pasa como argumento a otra función, para ser "llamada de vuelta" (called back) más tarde. Es la forma más fundamental de manejar la asincronía.

*Ejemplo con setTimeout (que simula una espera de red):*
```js
console.log("1. Pidiendo una mesa en Mueblería Jota...");
 
// setTimeout delega la tarea a una API del navegador.
setTimeout(() => {
  // Este código se ejecutará DESPUÉS de 2 segundos.
  console.log("3. ¡Mesa confirmada después de 2 segundos!");
}, 2000); // 2000 milisegundos = 2 segundos
 
console.log("2. Mientras esperas, puedes seguir mirando nuestro catálogo.");
```

*Orden de ejecución en la consola:*

+ Pidiendo una mesa...
+ Mientras esperas, puedes seguir mirando...
+ (...pasan 2 segundos...)
+ ¡Mesa confirmada...

Esto demuestra que JavaScript no se bloqueó esperando. Delegó la tarea y continuó. Sin embargo, cuando muchas operaciones asíncronas dependen unas de otras, los callbacks anidados crean el famoso "*Callback Hell*" o "Pirámide de la Condena", un código difícil de leer y mantener.

=== Promesas
Una *Promesa* es un objeto de JavaScript que representa un valor que puede estar disponible *ahora, en el futuro, o nunca*. Es una forma mucho más elegante y estructurada de manejar la asincronía.

Una Promesa tiene 3 estados:

+ *pending (pendiente):* El estado inicial. La operación aún no ha terminado.
+ *fulfilled (cumplida):* La operación terminó con éxito. La promesa tiene un valor resultante.
+ *rejected (rechazada):* La operación falló. La promesa tiene un motivo del error.

Para manejar estos estados, usamos los métodos .then() y .catch():

+ *.then(resultado => { ... }):* Se ejecuta cuando la promesa se cumple. Recibe el valor del éxito.
+ *.catch(error => { ... }):* Se ejecuta si la promesa es rechazada. Recibe el motivo del error.

*Ejemplo:*
```js
// Esta función simula una petición y devuelve una promesa.
function verificarStock() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      const hayStock = Math.random() > 0.5; // Simula aleatoriamente si hay stock o no
      if (hayStock) {
        resolve("Producto en stock. ¡Puedes comprar!"); // Promesa cumplida
      } else {
        reject("Lo sentimos, el producto está agotado."); // Promesa rechazada
      }
    }, 1500);
  });
}
 
console.log("Verificando stock del producto...");
 
verificarStock()
  .then(mensajeDeExito => {
    console.log("Éxito:", mensajeDeExito);
  })
  .catch(mensajeDeError => {
    console.error("Error:", mensajeDeError);
  })
  .finally(() => {
    console.log("Verificación de stock finalizada."); // .finally() se ejecuta siempre
  });
```
Las promesas se pueden encadenar, haciendo que el código sea mucho más legible que el Callback Hell.

=== async/await
*async/await* es la forma más moderna y legible de trabajar con promesas. Es "azúcar sintáctica" sobre las promesas, lo que significa que no las reemplaza, sino que nos permite escribirlas de una forma que parece código síncrono.
- *async:* Se coloca antes de una función para indicar que esta devolverá una promesa.
- *await:* Se usa *dentro* de una función async. Pausa la ejecución de la función hasta que una promesa se resuelva, y devuelve su valor.

Para manejar errores con async/await, usamos los bloques try...catch que ya conocemos.

*El mismo ejemplo, reescrito con async/await:*
```js
// La función que devuelve la promesa es la misma de antes.
// ...
 
// Creamos una función 'async' para poder usar 'await'
async function realizarCompra() {
  console.log("Verificando stock del producto (con async/await)...");
  try {
    // 'await' pausa la ejecución aquí hasta que la promesa de verificarStock se resuelva.
    const mensaje = await verificarStock();
    console.log("Éxito:", mensaje);
    console.log("Procediendo al pago...");
  } catch (error) {
    // Si la promesa es rechazada, el 'catch' la atrapará.
    console.error("Error:", error);
    console.log("No se puede continuar con la compra.");
  } finally {
    console.log("Verificación de stock finalizada.");
  }
}
 
realizarCompra(); // Llamamos a nuestra función asíncrona
```
Como puedes ver, el código dentro de realizarCompra se lee de arriba a abajo, casi como si fuera síncrono, lo que lo hace inmensamente más fácil de entender.

=== API fetch
Ahora que entendemos la asincronía, podemos usar la herramienta moderna del navegador para hacer peticiones de red: la *API fetch*. fetch está basada en promesas, por lo que funciona perfectamente con .then() o con async/await.

*Ejemplo: Pedir datos de un producto a una API pública (con async/await)*
```js
async function obtenerProducto(id) {
  try {
    const url = `https://jsonplaceholder.typicode.com/posts/${id}`;
    const respuesta = await fetch(url);
 
    // fetch no considera un error 404 como un rechazo de la promesa,
    // así que debemos verificar la respuesta manualmente.
    if (!respuesta.ok) {
      throw new Error(`Error HTTP: El estado es ${respuesta.status}`);
    }
 
    // response.json() también devuelve una promesa, ¡así que también usamos await!
    const datosProducto = await respuesta.json();
 
    console.log("Producto obtenido:", datosProducto);
 
  } catch (error) {
    console.error("No se pudo obtener el producto:", error);
  }
}
 
obtenerProducto(1); // Pedimos el producto con ID 1
```

= Node.js
== ¿Qué es Node.js y por qué lo usamos?
Es crucial entender esto: *Node.js NO es un nuevo lenguaje de programación*. Node.js es un *entorno de ejecución de JavaScript del lado del servidor*.

*Analogía:* Imagina que los ingenieros de Google tomaron el motor de JavaScript V8 (el corazón de Google Chrome que ejecuta el JS en el navegador), lo sacaron del auto (el navegador), lo pusieron sobre una mesa y le conectaron un montón de herramientas nuevas. Estas herramientas le dieron a JavaScript el poder de hacer cosas que en el navegador no puede, como:

- Interactuar con el sistema de archivos (leer y escribir archivos).
- Crear servidores web.
- Conectarse directamente a bases de datos.

=== ¿Por qué es tan popular en el stack MERN?
- *JavaScript en Todos Lados:* Usar JavaScript tanto en el frontend (React) como en el backend (Node.js) es increíblemente eficiente. Hablamos el mismo idioma en ambos lados del proyecto, lo que reduce la curva de aprendizaje y acelera el desarrollo.
- *Rendimiento:* Su modelo de operaciones de Entrada/Salida (I/O) asíncrono y no-bloqueante lo hace extremadamente rápido para aplicaciones que manejan muchas conexiones a la vez, como APIs o chats. No se queda esperando a que una tarea termine para empezar la siguiente.
- *Ecosistema Gigante (NPM):* Node.js viene con npm (Node Package Manager), el gestor de paquetes más grande del mundo. Es una biblioteca infinita de herramientas y librerías gratuitas que podemos instalar y usar para resolver casi cualquier problema, ahorrándonos miles de horas de trabajo.

== Instalación de Node.js y NPM
Para empezar, necesitamos instalar Node.js en nuestra computadora. El proceso es muy sencillo.

+ *Descargar el Instalador:* Ve a la página oficial de Node.js: https://nodejs.org/es/
+ *Elegir la Versión:* Verás dos opciones:

  - *LTS (Long Term Support):* Es la versión estable, probada y con soporte a largo plazo. Esta es la que debes elegir siempre.
  - *Current:* Contiene las últimas novedades, pero puede ser inestable. Es para quienes quieren experimentar.

+ *Ejecutar el Instalador:* Descarga el archivo para tu sistema operativo (Windows o macOS) y sigue los pasos del asistente. Es un proceso simple de "Siguiente > Siguiente > Finalizar".
+ *Verificar la Instalación:* Una vez instalado, abre tu terminal (Terminal, PowerShell, Git Bash, etc.) y ejecuta los siguientes dos comandos:

```sh
node -v
npm -v
```
5. Si todo salió bien, verás los números de las versiones instaladas (ej: v20.12.2 y 10.5.0).

== REPL: tu "patio de juegos" interactivo
Node.js incluye una herramienta muy útil llamada *REPL* (Read-Eval-Print-Loop). Es una consola interactiva que te permite escribir y probar código JavaScript al instante, sin necesidad de crear un archivo.

Para acceder, simplemente abre tu terminal y escribe:
```sh
node
```
Verás un cursor > esperando tus comandos. Puedes probar variables, funciones, operaciones, etc. Para salir, presiona Ctrl + C dos veces.

== Módulos core: las herramientas integradas de Node.js
Node.js viene con "módulos nativos" que nos dan funcionalidades esenciales. Para usarlos, necesitamos "requerirlos" en nuestro código usando la función require().

=== fs (File System)
Permite interactuar con el sistema de archivos.

*Ejemplo app.js:*
```js
const fs = require('fs'); // Requerimos el módulo
 
// Leer un archivo de forma asíncrona (la forma preferida)
fs.readFile('./mi_archivo.txt', 'utf8', (err, data) => {
  if (err) {
    console.error("Error al leer:", err);
    return;
  }
  console.log("Contenido del archivo:", data);
});
 
// Escribir en un archivo de forma asíncrona
const nuevoContenido = 'Escribiendo en un archivo con Node.js';
fs.writeFile('./nuevo_archivo.txt', nuevoContenido, (err) => {
  if (err) throw err;
  console.log('¡El archivo ha sido guardado!');
});
```

=== path
Ayuda a trabajar con rutas de archivos y directorios de forma compatible entre sistemas operativos (Windows usa \ y Linux/macOS usa /).

*Ejemplo app.js:*
```js
const path = require('path');
 
const rutaCompleta = path.join('/usuarios', 'documentos', 'factura.pdf');
console.log(rutaCompleta); // Salida: /usuarios/documentos/factura.pdf
 
const extension = path.extname(rutaCompleta);
console.log(extension); // Salida: .pdf
```

=== http: creando nuestro primer servidor web
¡Este es uno de los módulos más importantes! Nos permite crear un servidor HTTP desde cero. Es la base sobre la que se construyen frameworks como Express.js.

*Ejemplo server.js:*
```js
const http = require('http');
 
const PORT = 3000;
 
// Creamos el servidor
const server = http.createServer((req, res) => {
  // req: La petición que llega del cliente (navegador)
  // res: La respuesta que le vamos a enviar de vuelta
 
  if (req.url === '/') {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.end('<h1>Bienvenido a Mueblería Jota</h1>');
  } else if (req.url === '/productos') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    const productos = [{ id: 1, nombre: 'Silla' }, { id: 2, nombre: 'Mesa' }];
    res.end(JSON.stringify(productos));
  } else {
    res.writeHead(404, { 'Content-Type': 'text/html' });
    res.end('<h2>404 - Página No Encontrada</h2>');
  }
});
 
// Hacemos que el servidor "escuche" peticiones en el puerto 3000
server.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
```
*Para probarlo:*
+ Guarda el código como server.js.
+ En tu terminal, ejecuta node server.js.
+ Abre tu navegador y visita http://localhost:3000 y http://localhost:3000/productos. ¡Verás las respuestas que tu propio servidor está enviando!

== Creando y usando módulos
=== ¿Qué es un módulo y por qué deberían importarnos?
En Node.js, un módulo no es más que un archivo de JavaScript que encapsula código relacionado. Piensa en él como un capítulo de un libro o una caja de herramientas especializada. En lugar de tener una sola caja de herramientas gigante y desordenada, tienes una para la plomería, otra para la electricidad, etc.

==== ¿Por qué usamos módulos?
- *Organización:* Dividen una aplicación grande en partes pequeñas y lógicas. El código para manejar usuarios va en un módulo, el de productos en otro.
- *Reutilización:* Una vez que creas un módulo (ej: una función para validar emails), puedes usarlo en múltiples partes de tu proyecto o incluso en proyectos futuros.
- *Encapsulamiento:* Las variables y funciones dentro de un módulo son privadas por defecto. No pueden ser accedidas desde fuera a menos que tú decidas exportarlas explícitamente. Esto evita conflictos y hace el código más seguro.
- *Mantenibilidad:* Si hay un error en la lógica de los usuarios, sabes exactamente en qué archivo (user.js) buscar.

==== El Sistema de Módulos CommonJS

Node.js utiliza (tradicionalmente) un sistema de módulos llamado *CommonJS*. Se basa en dos comandos clave:

- *require():* La función que usamos para *importar* o "traer" un módulo a nuestro archivo actual.
- *module.exports:* Un objeto especial que usamos para *exportar* las partes de nuestro módulo que queremos hacer públicas y accesibles para otros archivos.

==== Creando Nuestro Primer Módulo
Vamos a crear un módulo para "Mueblería Jota" que contenga funciones de cálculo de precios.

===== Paso 1: Crear el Módulo (calculadoraPrecios.js)
Crea un archivo nuevo con este nombre.
```js
// calculadoraPrecios.js
 
const IVA = 0.21;
 
function sumarIva(precioBase) {
  return precioBase * (1 + IVA);
}
 
function calcularDescuento(precio, porcentaje) {
  const montoDescuento = (precio * porcentaje) / 100;
  return precio - montoDescuento;
}
 
// Hacemos que nuestras funciones sean públicas exportándolas.
// Asignamos un objeto a module.exports con lo que queremos exponer.
module.exports = {
  sumarIva: sumarIva,
  calcularDescuento: calcularDescuento
};
 
// Forma corta (si la clave y el valor tienen el mismo nombre):
// module.exports = { sumarIva, calcularDescuento };
```
*Explicación:* module.exports es el objeto que la función require() devolverá. Aquí, estamos diciendo que nuestro módulo exporta un objeto con dos propiedades: sumarIva y calcularDescuento, cuyos valores son las funciones que definimos arriba. La constante IVA sigue siendo privada y no se puede acceder desde fuera.

===== Paso 2: Usar o "Consumir" el Módulo (index.js)
Ahora, en nuestro archivo principal, vamos a usar las herramientas de nuestra nueva caja.
```js
// index.js
 
// 1. Importamos nuestro módulo. La ruta './' significa "en la misma carpeta".
const calculadora = require('./calculadoraPrecios.js');
 
// 2. 'calculadora' ahora contiene el objeto que exportamos.
const precioSilla = 5000;
const precioMesa = 20000;
 
// 3. Usamos las funciones del módulo
const precioFinalSilla = calculadora.sumarIva(precioSilla);
console.log(`El precio final de la silla es: $${precioFinalSilla}`);
// Salida: El precio final de la silla es: $6050
 
const precioMesaConDescuento = calculadora.calcularDescuento(precioMesa, 15); // Un 15% de descuento
console.log(`El precio de la mesa con descuento es: $${precioMesaConDescuento}`);
// Salida: El precio de la mesa con descuento es: $17000
```

===== Paso 3: Ejecutar el Código
En tu terminal, simplemente ejecuta el archivo principal:
```sh
node index.js
```
Verás los resultados de los cálculos, demostrando que tu index.js pudo usar con éxito la lógica definida en calculadoraPrecios.js.

==== Otras Formas de Exportar
A veces, un módulo tiene una única y principal funcionalidad. En esos casos, puedes exportar esa función directamente.

*Ejemplo: saludo.js*
```js
// Este módulo solo exporta una función.
module.exports = function(nombre) {
  console.log(`¡Hola, ${nombre}! Bienvenido a Mueblería Jota.`);
};
```
*Uso en index.js*
```js
const saludar = require('./saludo.js'); // 'saludar' ahora es la función misma
 
saludar('Ana'); // Salida: ¡Hola, Ana! Bienvenido a Mueblería Jota.
```

===== Una Nota sobre exports vs. module.exports

Quizás veas código que usa exports.miFuncion = .... Piensa en esto: module.exports es el *camión de envíos* real. exports es solo un *ayudante* que, por defecto, apunta a ese mismo camión. Puedes darle paquetes al ayudante (exports.algo = ...) y él los pondrá en el camión. Pero si intentas reemplazar al ayudante por un camión nuevo (exports = ...), el camión original (module.exports) se irá vacío.

*Recomendación para principiantes:* Para evitar confusiones, *usa siempre module.exports*. Es más explícito y seguro.

==== ¿Cómo Funciona require()?
Es importante saber cómo require() busca los módulos:

- *Si la ruta empieza con ./ o ../:* Node.js sabe que es un módulo local que tú has creado y lo busca en esa ruta relativa.
- *Si es solo un nombre ('http', 'express'):* Node.js asume que es un *módulo nativo* o un *paquete instalado con NPM* y lo buscará en la carpeta node_modules.

= NPM
== NPM: el gigantesco "App Store" para desarrolladores
*NPM (Node Package Manager)* es el gestor de paquetes de Node. Es dos cosas a la vez:

+ Un *repositorio online gigantesco* (la "tienda") que alberga cientos de miles de paquetes de código abierto (librerías, frameworks, herramientas).
+ Una *herramienta de línea de comandos* (npm) que usamos para instalar y gestionar esos paquetes en nuestros proyectos.

*Analogía:* Piensa en NPM como una *inmensa biblioteca de piezas de LEGO*. ¿Necesitas una rueda especial, una ventana o una figura de astronauta? No la fabricas, simplemente vas a la biblioteca (el repositorio de NPM), la pides con tu carnet (el comando npm), y la usas en tu construcción.

== package.json: el "DNI" de tu proyecto
Cada proyecto de Node.js que se considere serio tiene un archivo package.json en su raíz.

El package.json es el *manifiesto* o el *documento de identidad* de tu proyecto. Es un archivo en formato JSON que contiene metadatos importantes y, crucialmente, un registro de todas las "piezas de LEGO" (paquetes) que tu proyecto necesita para funcionar.

=== Creando tu package.json
Es muy fácil. Abre tu terminal, crea una carpeta para tu proyecto y dentro de ella, ejecuta:
```sh
# Crea y entra a la nueva carpeta
mkdir muebleria-jota-backend
cd muebleria-jota-backend
 
# Inicializa el proyecto
npm init
```
El comando npm init te hará una serie de preguntas (nombre del proyecto, versión, etc.). Puedes presionar Enter para aceptar los valores por defecto. Si quieres saltarte las preguntas y crear un package.json estándar de inmediato, puedes usar:
```sh
npm init -y
```
Esto creará un archivo package.json con un contenido similar a este:
```json
{
  "name": "muebleria-jota-backend",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}
```

==  Instalando paquetes: construyendo con herramientas de otros
Cuando instalamos un paquete, este se convierte en una *dependencia* de nuestro proyecto. Hay dos tipos:

*Analogía de la Cocina:*
- *dependencies (Dependencias de Producción):* Son los *ingredientes* de tu pastel (harina, azúcar, huevos). Tu aplicación final *no puede funcionar* sin ellas. Ejemplo: Express.
- *devDependencies (Dependencias de Desarrollo):* Son las *herramientas de la cocina* que usas para hacer el pastel (batidora, medidores, horno). Son esenciales para el desarrollo, pero no forman parte del pastel final. Ejemplo: Nodemon.

=== Comandos de Instalación
- *Para instalar una dependencia de producción:*
```sh
npm install express
# Forma corta: npm i express
```

- *Para instalar una dependencia de desarrollo:*
```sh
npm install nodemon --save-dev
# Forma corta: npm i nodemon -D
```

=== ¿Qué Sucede Cuando Instalas un Paquete?
+ *Se crea la carpeta node_modules:* Este es el "almacén" donde se descargan y guardan físicamente todos los paquetes que instalas (y sus propias dependencias). ¡Puede llegar a ser muy grande!
+ *Se actualiza package.json:* NPM añade automáticamente el paquete y su versión a la sección dependencies o devDependencies.
+ *Se crea/actualiza package-lock.json:* Este archivo es un registro exacto de las versiones de CADA paquete instalado. Garantiza que si otro desarrollador clona tu proyecto y ejecuta npm install, instalará exactamente las mismas versiones que tú, evitando problemas de compatibilidad.

*La Regla de Oro: .gitignore y node_modules*

La carpeta node_modules *NUNCA* se debe subir a un repositorio de Git. Para asegurarte de esto, crea un archivo .gitignore en la raíz de tu proyecto y añade la siguiente línea:
```gitignore
node_modules/
```
Cuando alguien clone tu proyecto, no descargará esta carpeta. Simplemente tendrá que ejecutar npm install en su terminal, y NPM leerá el package.json para reconstruir la carpeta node_modules a la perfección.

== NPM scripts: automatizando tus tareas
La sección "scripts" de tu package.json es un lugar para definir atajos o alias para comandos de la terminal que usas frecuentemente.

*Ejemplo package.json*
```json
"scripts": {
  "start": "node server.js",
  "dev": "nodemon server.js",
  "test": "jest"
}
```

*Cómo ejecutarlos:*
- npm run dev (ejecutará nodemon server.js)
- npm test (los scripts start y test tienen atajos y no necesitan run)
- npm start

=== Ejemplo Práctico con nodemon
nodemon es una herramienta de desarrollo que reinicia automáticamente tu servidor cada vez que guardas un cambio en un archivo. ¡Es un ahorro de tiempo increíble!

+ *Instálalo:* `npm i nodemon -D`
+ *Crea tu archivo principal:* server.js con un console.log('Servidor iniciado...');
+ *Añade el script "dev" a tu package.json:*
```json
"scripts": {
  "dev": "nodemon server.js"
}
```
4. *Ejecútalo desde la terminal:*
```sh
npm run dev
```
Ahora, cada vez que modifiques y guardes el archivo server.js, verás cómo la terminal se refresca y tu servidor se reinicia solo. Este flujo de trabajo (npm init -> npm install -> npm run dev) es el que usarás en casi todos tus proyectos de backend.

= Express.js

== ¿Qué es Express.js y por qué lo necesitamos?
Express.js es un *framework web minimalista y flexible para Node.js.*

*Analogía:* Si el módulo http te da las materias primas (metal, madera, tornillos), *Express.js es como un kit de muebles de IKEA*. Te da piezas pre-cortadas, instrucciones claras (app.get, app.post) y herramientas especializadas que hacen el proceso de construcción de tu servidor (o mueble) inmensamente más rápido, fácil y con menos errores.

*¿Por qué usarlo?*
- *Simplificación Extrema:* Abstrae la complejidad del módulo http. Tareas como manejar rutas, leer datos de una petición y enviar respuestas se vuelven mucho más intuitivas.
- *Manejo de Rutas (Routing):* Proporciona un sistema potente y claro para definir cómo tu aplicación responde a diferentes URLs y métodos HTTP (GET, POST, etc.). Esto es el corazón de cualquier API.
- *Middleware:* Permite ejecutar código en medio del ciclo de petición-respuesta. Es una de sus características más poderosas, ideal para autenticación, logging, y procesar datos.
- *Estructura y Organización:* Fomenta un código más limpio y modular, que es más fácil de mantener a medida que la aplicación crece.

== Nuestro primer servidor con Express
=== Paso 1: preparar el proyecto
En tu terminal, creá una nueva carpeta e inicializa un proyecto de NPM.
```sh
mkdir muebleria-api
cd muebleria-api
npm init -y
```
Ahora, instalá express como una dependencia de producción.
```sh
npm install express
```

=== Paso 2: escribir el código del servidor (server.js)
Creá un archivo server.js en la raíz de tu proyecto.
```js
// 1. Requerir el módulo express
const express = require('express');
 
// 2. Crear una instancia de la aplicación
const app = express();
 
// 3. Definir el puerto. Es una buena práctica usar una variable de entorno para producción.
const PORT = process.env.PORT || 4000;
 
// 4. Definir nuestra primera ruta (endpoint)
// Cuando un cliente haga una petición GET a la raíz ('/'), se ejecutará esta función.
app.get('/', (req, res) => {
  // req (request): Objeto con información sobre la petición que llega.
  // res (response): Objeto con métodos para enviar una respuesta al cliente.
  
  // Usamos res.send() para enviar una respuesta simple.
  res.send('¡Bienvenido al API de Mueblería Jota!');
});
 
// 5. Poner el servidor a escuchar peticiones
app.listen(PORT, () => {
  console.log(`Servidor corriendo exitosamente en http://localhost:${PORT}`);
});
```

=== Paso 3: configurar scripts y ejecutar
Para facilitar el desarrollo, vamos a usar nodemon. Si no lo tienes, instalalo: npm install nodemon -D. Luego, en tu package.json, añadí el script "dev":
```json
"scripts": {
  "start": "node server.js",
  "dev": "nodemon server.js"
}
```
¡Ahora, iniciá tu servidor con el nuevo script!
```sh
npm run dev
```
Abrí tu navegador y ve a http://localhost:4000. Deberías ver el mensaje de bienvenida.

== Rutas y métodos HTTP
El *routing* (o enrutamiento) consiste en definir cómo responde la aplicación a una petición de un cliente a un endpoint particular (una URL y un método HTTP específico).
- *GET:* Para solicitar y obtener datos.
- *POST:* Para crear un nuevo recurso.
- *PUT:* Para actualizar completamente un recurso.
- *DELETE:* Para eliminar un recurso.

Vamos a expandir nuestro server.js con más rutas:
```js
// server.js
 
const express = require('express');
const app = express();
const PORT = process.env.PORT || 4000;
 
// Middleware para parsear JSON. ¡Crucial para peticiones POST/PUT!
// Le dice a Express que si llega un cuerpo de petición en formato JSON, lo convierta en un objeto JavaScript.
app.use(express.json());
 
// --- RUTAS ---
app.get('/', (req, res) => {
  res.send('¡Bienvenido al API de Mueblería Jota!');
});
 
// GET para obtener todos los productos
app.get('/api/productos', (req, res) => {
  const productos = [
    { id: 1, nombre: 'Silla de Comedor', precio: 5000 },
    { id: 2, nombre: 'Mesa de Roble', precio: 25000 }
  ];
  res.json(productos); // res.json() envía una respuesta en formato JSON.
});
 
// POST para crear un nuevo producto
app.post('/api/productos', (req, res) => {
  // Gracias a app.use(express.json()), podemos leer el cuerpo de la petición.
  const nuevoProducto = req.body; 
  console.log('Producto recibido:', nuevoProducto);
 
  // Aquí iría la lógica para guardar en la base de datos...
  
  // Enviamos una respuesta de éxito con el código 201 (Created).
  res.status(201).json({ 
    mensaje: 'Producto creado con éxito', 
    producto: nuevoProducto 
  });
});
 
// ...
 
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
```

== Probando nuestra API
- Las rutas GET las puedes probar directamente en el navegador.
- Para probar rutas POST, PUT o DELETE, necesitas una herramienta que te permita construir peticiones HTTP completas.

=== Herramientas recomendadas
- *Postman o Insomnia:* Aplicaciones de escritorio muy completas.
- *Thunder Client:* Una extensión para VS Code que se integra directamente en tu editor.

=== Para probar la ruta POST /api/productos:
+ Abrí tu herramienta (ej: Postman).
+ Elegí el método POST.
+ Ingresá la URL: http://localhost:4000/api/productos.
+ Andá a la pestaña "Body", selecciona "raw" y el tipo "JSON".
+ Escribí el JSON de tu nuevo producto, por ejemplo:
```json
{
  "nombre": "Lámpara de Pie",
  "precio": 7500
}
```
6. Enviá la petición. Deberías recibir una respuesta 201 Created y ver el console.log en tu terminal del servidor.

== Middleware
=== ¿Qué es el middleware?
En Express, un middleware es simplemente una *función* que se interpone en el medio del ciclo de una petición. Tiene acceso al objeto de la solicitud (req), al objeto de la respuesta (res), y a una función especial llamada next.

*Analogía:* *El Control de Seguridad de un Aeropuerto* Imagina que una petición a tu servidor es un *pasajero* que quiere llegar a su puerta de embarque (la lógica final de tu ruta). Antes de llegar, debe pasar por *varios puntos de control* (los middlewares).

- En el primer control (Middleware 1), le revisan el pasaporte.
- En el segundo (Middleware 2), escanean su equipaje.
- En el tercero (Middleware 3), verifican su ticket de embarque.

Cada uno de estos controles es un middleware. Cada uno puede:
+ *Ejecutar código:* Revisar el pasaporte, escanear, etc.
+ *Hacer cambios:* "Sellar" el pasaporte (añadir información al objeto req).
+ *Finalizar el ciclo:* Si el pasajero no tiene pasaporte, le deniegan la entrada y lo sacan de la fila (enviando una respuesta como res.status(401).send(...)).
+ *Pasar al siguiente control:* Si todo está en orden, el guardia llama a next(), que es como decir: "Todo bien, puede avanzar al siguiente punto de control".

Si un middleware no envía una respuesta ni llama a next(), el "pasajero" se queda atascado en ese control para siempre, y la petición nunca se completa.

=== Middleware incorporado (built-in) - las herramientas de fábrica
Express viene con algunos middlewares esenciales que usaremos en casi todos los proyectos.

==== express.json() - el traductor de JSON
Cuando un cliente (como nuestra futura app de React) nos envía datos en una petición POST o PUT, generalmente lo hace en formato JSON. Por defecto, Express no entiende este formato.

express.json() es un middleware que *intercepta la petición, revisa si el cuerpo es JSON, y si es así, lo convierte (parsea) en un objeto de JavaScript* que podemos usar cómodamente en req.body.

```js
const express = require('express');
const app = express();
 
// Usamos el middleware. ¡Debe ir ANTES de las rutas que lo necesiten!
app.use(express.json());
 
app.post('/api/productos', (req, res) => {
  // Gracias a express.json(), req.body ahora es un objeto JS con los datos del cliente.
  const nuevoProducto = req.body; 
  console.log(nuevoProducto); // { "nombre": "Sofá", "precio": 120000 }
  res.status(201).json({ mensaje: 'Producto recibido' });
});
```

==== express.static() - el servidor de archivos
Este middleware permite que Express sirva archivos estáticos (como imágenes, archivos CSS o incluso tu aplicación de React compilada) directamente desde una carpeta en tu servidor.
```js
// Le decimos a Express que cualquier petición a un archivo que exista
// en la carpeta 'public' debe ser servida directamente.
app.use(express.static('public'));
 
// Si ahora un usuario visita http://localhost:4000/imagenes/logo.png,
// Express buscará y devolverá el archivo /public/imagenes/logo.png.
```

=== Creando middleware personalizado
La verdadera flexibilidad de Express se manifiesta cuando creamos nuestros propios middlewares para tareas como logging, autenticación, validación, etc.

==== Ejemplo 1: un logger de peticiones (middleware global)
Vamos a crear un middleware simple que imprima en la consola cada petición que llega a nuestro servidor.

```js
// mi-logger.js
const logger = (req, res, next) => {
  console.log(`Petición Recibida: ${req.method} en la ruta ${req.originalUrl}`);
  
  // ¡Crucial! Llamamos a next() para que la petición pueda continuar su viaje.
  next(); 
};
 
// server.js
const logger = require('./mi-logger.js');
// ...
app.use(logger); // Lo aplicamos globalmente. Se ejecutará para CADA petición.
```

==== Ejemplo 2: un "guardia" de autenticación (middleware a nivel de ruta)
Ahora, un middleware más complejo que protegerá una ruta específica. Solo permitirá el acceso si la petición incluye un "token" secreto en los encabezados.

```js
// auth-guard.js
const authGuard = (req, res, next) => {
  // Obtenemos el valor del encabezado 'authorization'
  const tokenRecibido = req.headers['authorization'];
 
  if (tokenRecibido === 'muebles123') {
    // El token es correcto. Añadimos información al objeto req y continuamos.
    req.usuario = { id: 1, rol: 'admin' };
    next(); // ¡Permitimos el paso!
  } else {
    // El token es incorrecto o no existe.
    // Enviamos una respuesta de error y NO llamamos a next().
    res.status(401).json({ mensaje: 'Acceso no autorizado.' });
  }
};
 
// server.js
const authGuard = require('./auth-guard.js');
// ...
 
// Esta ruta es pública y no usa el middleware.
app.get('/api/productos', (req, res) => { /* ... */ });
 
// Esta ruta ESTÁ PROTEGIDA. Pasamos el middleware antes del controlador final.
app.get('/api/admin/panel', authGuard, (req, res) => {
  // Si llegamos aquí, es porque authGuard llamó a next().
  // Podemos acceder a la información que el middleware añadió a req.
  res.send(`Bienvenido al panel de admin, usuario con ID: ${req.usuario.id}`);
});
```
*Para probar la ruta protegida*, necesitarás una herramienta como Postman o Thunder Client para añadir el encabezado Authorization con el valor muebles123 a tu petición GET.

=== Puntos clave sobre middleware
- *El Orden Importa:* Express ejecuta los middlewares en el orden en que se definen en el código.
- *Global vs. Específico:* app.use(miMiddleware) lo aplica a todas las rutas que vengan después. Pasarlo como argumento a una ruta (ej: app.get('/', miMiddleware, ...)), lo aplica solo a esa ruta.
- *La Misión de next():* Es la clave para que la cadena continúe. Si un middleware no envía una respuesta ni llama a next(), la petición del cliente quedará esperando para siempre.

== Rutas y Errores
=== Organización de rutas con express.Router (el archivador)
*El Problema:* Tener todas las rutas (app.get, app.post, etc.) para usuarios, productos, y pedidos en un solo archivo es un caos.

*La Solución:* express.Router nos permite actuar como si tuviéramos un *archivador con cajones etiquetados*. Creamos un "cajón" (un archivo) para cada tipo de recurso (usuarios, productos) y guardamos sus "documentos" (rutas) ahí. Nuestro server.js se mantiene limpio, actuando como la oficina principal que simplemente sabe a qué cajón dirigir cada solicitud.

==== Paso a paso: creando un módulo de rutas
*Paso 1: Crear el "Cajón" (El Archivo de Rutas)* En la raíz de tu proyecto, crea una carpeta routes. Dentro, crea el archivo userRoutes.js.

*Paso 2: Guardar los "Documentos" en el Cajón (Definir las Rutas)* Dentro de userRoutes.js, usamos una instancia de Router en lugar de app.

*routes/userRoutes.js*
```js
const express = require('express');
const router = express.Router(); // ¡Creamos una instancia de Router!
 
// Datos de ejemplo
const users = [{ id: 1, name: 'Ana' }, { id: 2, name: 'Luis' }];
 
// GET /api/users/  (la ruta es relativa al punto de montaje)
router.get('/', (req, res) => {
  res.json(users);
});
 
// GET /api/users/:id
router.get('/:id', (req, res) => {
  const user = users.find(u => u.id === parseInt(req.params.id));
  if (!user) {
    return res.status(404).json({ message: 'Usuario no encontrado' });
  }
  res.json(user);
});
 
// POST /api/users/
router.post('/', (req, res) => {
    // ... lógica para crear un usuario ...
    res.status(201).json({ message: 'Usuario creado' });
});
 
// 3. Exportamos el router para que la app principal pueda usarlo
module.exports = router;
```
*Paso 3: Colocar el "Cajón" en la Oficina (Montar el Router en server.js)* Ahora, en nuestro archivo principal, importamos y "montamos" el router.

*server.js*
```js
const express = require('express');
const app = express();
 
// Importamos nuestro nuevo módulo de rutas
const userRoutes = require('./routes/userRoutes');
const productRoutes = require('./routes/productRoutes'); // (Haríamos lo mismo para productos)
 
app.use(express.json());
 
// Le decimos a la app: "Para cualquier ruta que empiece con /api/users,
// deja que el 'userRoutes' se encargue".
app.use('/api/users', userRoutes);
app.use('/api/products', productRoutes);
 
// ... resto del código del servidor ...
```
¡Listo! Ahora tu server.js está limpio y tus rutas perfectamente organizadas por recurso.

=== Manejo de errores centralizado
*El Problema:* Repetir bloques try...catch en cada controlador es tedioso y propenso a errores. Si se nos olvida uno, el servidor puede crashear.

*La Solución:* Crear un *middleware de manejo de errores* centralizado.

*Analogía:* En lugar de que cada habitación tenga su propio extintor de incendios (que podría o no funcionar), tienes un *equipo de bomberos profesional* (errorHandler) que es llamado automáticamente cada vez que suena una alarma (error) en cualquier parte del edificio.

==== ¿Cómo Funciona?
Express reconoce un middleware de manejo de errores por su firma única de *cuatro argumentos*: (err, req, res, next). Cuando llamas a next(unError), Express se salta todos los demás middlewares y va directamente a este "equipo de emergencias".

*¡Debe ser el último app.use() que definas en tu server.js!*

==== Implementación práctica
*Paso 1: Modificar los Controladores para que "Tiren de la Alarma"* En nuestras rutas, en lugar de manejar el error ahí mismo, se lo pasamos a next().

*routes/userRoutes.js (extracto)*
```js
router.get('/:id', (req, res, next) => { // Observa el 'next' aquí
  const user = users.find(u => u.id === parseInt(req.params.id));
  
  if (!user) {
    const error = new Error('Usuario no encontrado');
    error.status = 404;
    return next(error); // ¡Llamamos a los bomberos!
  }
  
  res.json(user);
});
```

*Paso 2: Crear el Middleware para Rutas No Encontradas (404)* Justo antes de tu manejador de errores final, puedes poner un "atrapa-todo" para las rutas que no existen.

*server.js*
```js
// ... después de montar todas tus rutas ...
app.use((req, res, next) => {
  const error = new Error(`Ruta no encontrada: ${req.originalUrl}`);
  error.status = 404;
  next(error); // Se lo pasamos a nuestro manejador de errores central
});
```
*Paso 3: Definir el Manejador de Errores Centralizado* Este es nuestro "cuartel de bomberos". Recibe todos los errores y decide cómo responder al cliente.

*server.js (al final del archivo)*
```js
// Este middleware SIEMPRE va al final.
app.use((err, req, res, next) => {
  // Determinamos el código de estado. Si el error no tiene uno, es un 500 (Error Interno del Servidor).
  const statusCode = err.status || 500;
  
  // Logueamos el error en la consola del servidor para depuración
  console.error(err.message, err.stack);
  
  // Enviamos una respuesta JSON clara al cliente
  res.status(statusCode).json({
    message: err.message || 'Ha ocurrido un error en el servidor.',
    // Solo mostramos el detalle del error si no estamos en producción
    stack: process.env.NODE_ENV === 'production' ? '🥞' : err.stack,
  });
});
```