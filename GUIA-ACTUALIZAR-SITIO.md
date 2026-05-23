# Guia rapida para actualizar la pagina sin saber programar

Esta guia es para cambiar propiedades, textos y fotos de NJ Remodeling and Rental sin tener que tocar codigo directamente.

## La forma mas facil ahora

Abre el archivo `admin.html` en tu navegador. Desde ese panel puedes:

- agregar una casa nueva
- editar direccion, ciudad, estado, habitaciones, banos y pies cuadrados
- subir fotos desde tu computadora
- pegar enlaces de fotos de Zillow, Redfin u otra fuente publica
- escoger la foto principal
- quitar casas
- exportar o importar un respaldo

Cuando guardas, los cambios se ven en `rentals.html` y `property.html` en ese mismo navegador.

## Respaldos

Despues de hacer cambios importantes, presiona **Exportar respaldo**. Eso descarga un archivo llamado `nj-propiedades-respaldo.json`.

Si cambias de computadora o navegador, abre `admin.html`, presiona **Importar respaldo** y selecciona ese archivo.

## Tambien puedes pedirme ayuda

Usa una tabla sencilla con los datos de cada propiedad y pideme a Codex:

> Actualiza la pagina con esta tabla de propiedades.

Tambien puedes decir:

> Quita la propiedad 2205 Elmhurst Ave.

O:

> Agrega estas fotos de Zillow a 5903 Jessamine Ln.

## Datos que debes tener por propiedad

Copia y llena esta lista para cada casa:

- Activa: si / no
- Direccion:
- Ciudad:
- Estado:
- ZIP:
- Habitaciones:
- Banos:
- Pies cuadrados:
- Descripcion en espanol:
- Descripcion en ingles:
- Link de Zillow:
- Fotos:

## Como quitar una propiedad

Solo dime la direccion y si quieres quitarla de:

- la pagina principal
- la pagina de rentas
- la pagina de detalles
- todas las paginas

Ejemplo:

> Quita 103 Scottsdale Blvd de todas las paginas.

## Como agregar fotos

La mejor forma es darme el link publico de Zillow de la propiedad y decir:

> Usa las fotos interiores de este link para la galeria.

Si Zillow no deja descargar las fotos directamente, la pagina puede usar enlaces publicos de Zillow/Redfin o fotos guardadas dentro de la carpeta `assets/properties`.

## Importante

Este panel funciona muy bien para manejar la pagina desde tu computadora, pero no tiene contrasena ni servidor. Cuando la pagina este publicada para clientes reales, lo ideal sera conectar un panel privado con usuario y contrasena para que los cambios se publiquen en internet de forma permanente.

Por ahora, usa `admin.html` como panel local y guarda respaldos cada vez que cambies propiedades.
