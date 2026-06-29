# Guia rapida para actualizar la pagina sin saber programar

Esta guia es para cambiar propiedades, textos y fotos de NJ Remodeling and Rental sin tener que tocar codigo directamente.

## Nuevo: cuentas de usuario y propiedades compartidas

Ahora el sitio usa una base de datos en la nube (Supabase) para que **cualquier persona pueda crear una cuenta y publicar una propiedad**, y tu (el administrador) apruebas cada propiedad antes de que se vea en `rentals.html`.

### Como publica una propiedad un usuario nuevo

1. Entra a `login.html` y crea una cuenta con su correo y una contrasena.
2. Si Supabase pide confirmar el correo, el usuario revisa su bandeja de entrada y confirma.
3. Inicia sesion y lo manda automaticamente a `dashboard.html`.
4. En `dashboard.html` presiona **New property**, llena los datos, sube o pega fotos, y guarda.
5. La propiedad queda marcada como **Pending** hasta que tu la apruebes. No se ve todavia en el sitio publico.

### Como apruebas tu las propiedades nuevas (administrador)

1. Inicia sesion como administrador en `login.html` con el correo `njremodelingrental@gmail.com`.
2. Abre `admin.html` (te pedira la contrasena del panel, igual que antes).
3. En la seccion **Solicitudes pendientes** vas a ver cada propiedad nueva o editada por un usuario, con botones **Aprobar** y **Rechazar**.
4. Al aprobar, la propiedad aparece de inmediato en `rentals.html` y `property.html` para todos los visitantes.
5. Al rechazar, la propiedad se borra.

### Configuracion de Supabase (ya hecha una vez)

Si alguna vez necesitas recrear esto desde cero (por ejemplo, un proyecto de Supabase nuevo):

1. Crea el proyecto en https://supabase.com y copia su **Project URL** y **Publishable key** dentro de `supabase-config.js`.
2. Abre el **SQL Editor** del proyecto y corre el archivo `supabase/schema.sql` (crea las tablas y las reglas de seguridad).
3. Despues de que la cuenta `njremodelingrental@gmail.com` se registre una vez en `login.html`, corre `supabase/promote-admin.sql` para volverla administrador.
4. Inicia sesion como esa cuenta en `admin.html` y presiona **Migrar propiedades originales** para copiar las casas que ya estaban en el sitio a la base de datos nueva, ya aprobadas.

## El panel local antiguo (admin.html, seccion "Inventario local")

`admin.html` todavia tiene el panel viejo que guarda cambios solo en el navegador de tu computadora (no se comparte con otros visitantes). Sirve para pruebas rapidas, pero **ya no es la forma principal de publicar propiedades**. Usa el flujo de cuentas de arriba para que los cambios se vean en internet para todos.

Cuando entras a `admin.html` te va a pedir una contrasena antes de mostrar el panel (proteccion basica, no es seguridad de servidor real).

## Respaldos

Despues de hacer cambios importantes en el panel local antiguo, presiona **Exportar respaldo**. Eso descarga un archivo llamado `nj-propiedades-respaldo.json`.

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

Si la publico un usuario, entra a `dashboard.html` con su cuenta (o pidele que lo haga) y presiona **Remove property**. Si tu eres administrador, tambien puedes borrarla desde la lista de pendientes o aprobadas en Supabase.

Para el panel local antiguo, solo dime la direccion y si quieres quitarla de:

- la pagina principal
- la pagina de rentas
- la pagina de detalles
- todas las paginas

## Como agregar fotos

La mejor forma es darme el link publico de Zillow de la propiedad y decir:

> Usa las fotos interiores de este link para la galeria.

Si Zillow no deja descargar las fotos directamente, la pagina puede usar enlaces publicos de Zillow/Redfin o fotos guardadas dentro de la carpeta `assets/properties`.

## Importante

El panel local antiguo (`admin.html`, seccion "Inventario local") solo guarda cambios en tu navegador y no los comparte con otros visitantes. La forma correcta de publicar para todos ahora es: el usuario crea su propiedad en `dashboard.html`, y tu la apruebas en `admin.html`. La contrasena de `admin.html` sigue siendo una proteccion basica, no seguridad de servidor real; la seguridad real de quien puede editar que propiedad la maneja Supabase con las reglas de la base de datos.
