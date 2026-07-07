# Cambios de la actualizacion de mejoras (julio 2026)

Este documento resume todo lo que cambio en el sitio y **los 2 pasos que debes hacer tu** para activarlo todo.

---

## PASO 1 (OBLIGATORIO): correr el SQL en Supabase

Sin este paso, el formulario de contacto, las fotos nuevas y los rechazos con motivo NO van a funcionar.

1. Entra a https://supabase.com y abre tu proyecto.
2. Ve a **SQL Editor** -> **New query**.
3. Abre el archivo `supabase/actualizacion-mejoras.sql`, copia TODO su contenido, pegalo y presiona **Run**.
4. Debe decir "Success". Ya quedo.

Esto crea: la tabla de mensajes de contacto (`leads`), las columnas de rechazo con motivo, y el almacen de fotos (`property-photos`).

## PASO 2 (OBLIGATORIO): subir los archivos nuevos a GitHub

Sube todos los archivos de esta carpeta a tu repositorio (reemplazando los viejos). Archivos nuevos: `site-nav.js`, `404.html`, `supabase/actualizacion-mejoras.sql`, este documento. Archivo eliminado: `styles.min.css` (borralo del repositorio).

---

## Que cambio (resumen por area)

### Para los clientes (visitantes)
- **Menu movil**: ahora en celulares aparece un boton de menu (hamburguesa) que despliega la navegacion. Antes el menu desaparecia.
- **Formulario de contacto real**: los mensajes se guardan en la base de datos y tu los ves en `admin.html` (seccion "Mensajes de clientes"). Si la base de datos fallara, se abre el correo del visitante como respaldo. Los campos ahora son obligatorios.
- **Boton de WhatsApp** flotante en inicio, rentas y detalle de propiedad (abre chat al 502-554-0333).
- **Rentas ordenables**: en la pagina de rentas se puede ordenar por precio o por mas recientes, y los resultados se muestran de 12 en 12 con boton "Mostrar mas".
- **Propiedades destacadas automaticas**: la pagina de inicio ahora muestra las propiedades aprobadas de la base de datos. Ya no hay que editar el HTML a mano cuando cambies una casa.

### Para usuarios con cuenta
- **Olvide mi contrasena**: en `login.html` hay un enlace para recibir un correo de recuperacion y fijar una nueva contrasena.
- **Rechazos con motivo**: si rechazas una propiedad, el usuario ve "Rejected" y el motivo en su panel, la corrige y al guardar vuelve a tu cola de revision. Ya no se borra.
- **Aviso claro**: si un usuario edita una propiedad ya publicada, el panel le avisa que los cambios pasan por tu revision antes de verse en publico.
- **Fotos mas ligeras**: las fotos se comprimen y se suben a Supabase Storage; la base de datos solo guarda la direccion. Esto evita llenar el plan gratis.

### Para ti (admin)
- **Ya no hay contrasena extra** en `admin.html`. La unica llave es tu cuenta de Supabase (njremodelingrental@gmail.com), que es la seguridad real. Inicia sesion en `login.html` y abre `admin.html`.
- **Se retiro el panel viejo** que guardaba cambios solo en tu navegador. Para publicar o editar casas usa el boton "Publicar / editar propiedades" (te lleva al dashboard, donde como admin ves TODAS las propiedades).
- **Bandeja de mensajes**: en `admin.html` ves los mensajes del formulario de contacto, los marcas como atendidos o los borras.
- **Contador de pendientes**: el titulo de la pestana muestra cuantas solicitudes esperan revision, ej. "(3) Admin".
- **Un solo archivo de estilos**: ahora todo usa `styles.css`. Cualquier cambio ahi se ve de inmediato (antes habia que re-minificar).

### SEO y detalles
- Cada propiedad muestra su propio titulo y descripcion en Google.
- `sitemap.xml` ahora incluye las propiedades individuales.
- Nueva pagina `404.html` cuando alguien entra a un enlace roto.
- Espacio preparado para Google Analytics (busca "ANALITICAS" dentro de index.html, rentals.html y property.html y sigue las instrucciones del comentario).

## Recomendaciones pendientes (no requieren codigo)
- **Aviso por correo de nuevas solicitudes**: en Supabase puedes crear un Database Webhook (Database -> Webhooks) sobre la tabla `properties` conectado a un servicio como Zapier o Make para que te llegue un correo. Mientras tanto, revisa `admin.html`: el titulo de la pestana te dice cuantas hay.
- **Fotos de Zillow/Redfin**: siguen siendo enlaces externos con respaldo automatico si fallan. Lo ideal es que poco a poco subas esas fotos con el boton de "Upload photos" del dashboard para que queden en tu propio almacen.
- **Analiticas**: activa el bloque de Google Analytics cuando tengas tu codigo G-.
