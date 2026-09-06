# ISSUE 01 - FE: Base styles and entry
## Resumen
Se configuro la base visual del frontend y el punto de entrada principal de la aplicacion para iniciar el flujo de modulos.

## Criterios de aceptacion
- Estructura base del frontend inicializada.
- Estilos globales base definidos.
- Entrada principal conectada.

## Commits relacionados
- `e67af7d`

## Metadatos sugeridos
- Status: `Done`
- Labels: `frontend`, `done`
- Priority: `P1`

---

# ISSUE 02 - FE: Main app component
## Resumen
Se implemento el componente principal de la aplicacion para centralizar rutas/vistas iniciales del sistema.

## Criterios de aceptacion
- Componente principal creado y funcional.
- Integracion con la estructura del frontend.

## Commits relacionados
- `1c19329`

## Metadatos sugeridos
- Status: `Done`
- Labels: `frontend`, `done`
- Priority: `P1`

---

# ISSUE 03 - FE: Admin module
## Resumen
Se implemento el modulo de administrador en frontend para gestion operativa del sistema.

## Criterios de aceptacion
- Vista/modulo admin disponible.
- Integracion con flujo principal de la app.

## Commits relacionados
- `7ebb71c`

## Metadatos sugeridos
- Status: `Done`
- Labels: `frontend`, `admin`, `done`
- Priority: `P1`

---

# ISSUE 04 - FE: Auth module
## Resumen
Se implemento el modulo de autenticacion para inicio de sesion y control de acceso por usuario.

## Criterios de aceptacion
- Flujo de autenticacion integrado.
- Base para validacion de sesion en frontend.

## Commits relacionados
- `7022ea5`

## Metadatos sugeridos
- Status: `Done`
- Labels: `frontend`, `auth`, `done`
- Priority: `P1`

---

# ISSUE 05 - FE: Cliente module
## Resumen
Se implemento el modulo del cliente para consulta de informacion de ordenes y acciones asociadas.

## Criterios de aceptacion
- Vista de cliente integrada.
- Navegacion desde app principal.

## Commits relacionados
- `338ebca`

## Metadatos sugeridos
- Status: `Done`
- Labels: `frontend`, `cliente`, `done`
- Priority: `P1`

---

# ISSUE 06 - FE: Recepcion module
## Resumen
Se implemento el modulo de recepcion para soporte al flujo de registro y gestion de atencion.

## Criterios de aceptacion
- Modulo recepcion habilitado.
- Integracion con flujo general de trabajo.

## Commits relacionados
- `f7cdddd`

## Metadatos sugeridos
- Status: `Done`
- Labels: `frontend`, `recepcion`, `done`
- Priority: `P1`

---

# ISSUE 07 - FE: Tecnico module
## Resumen
Se implemento el modulo tecnico para seguimiento de diagnostico y gestion del estado de ordenes.

## Criterios de aceptacion
- Modulo tecnico agregado a la app.
- Base para operacion de tecnico habilitada.

## Commits relacionados
- `88b5820`

## Metadatos sugeridos
- Status: `Done`
- Labels: `frontend`, `tecnico`, `done`
- Priority: `P1`

---

# ISSUE 08 - BE: Portal cliente y facturacion de ordenes
## Resumen
Se mejoro el backend para portal de cliente, gestion de pagos y generacion de factura PDF por orden pagada.

## Criterios de aceptacion
- Endpoints de perfil cliente (`/clientes/me`) agregados.
- Consulta de mis ordenes con tecnico/grupo y pagos.
- Endpoint de factura para cliente y recepcion/admin.
- Validaciones de pago por saldo y estado de orden.

## Commits relacionados
- `15b2dec`

## Metadatos sugeridos
- Status: `Done`
- Labels: `backend`, `cliente`, `facturacion`, `done`
- Priority: `P0`

---

# ISSUE 09 - BE: Administracion de usuarios y roles
## Resumen
Se agrego gestion completa de usuarios (listar, crear, editar, reset password, eliminar) con control de seguridad por rol.

## Criterios de aceptacion
- CRUD operativo para usuarios administradores.
- Consulta de roles disponible.
- Reglas de seguridad para no perder ultimo admin activo.
- Sincronizacion con tecnicos/clientes segun rol.

## Commits relacionados
- `3486744`

## Metadatos sugeridos
- Status: `Done`
- Labels: `backend`, `usuarios`, `roles`, `done`
- Priority: `P0`

---

# ISSUE 10 - DB/Docs: modelo, schema y migraciones
## Resumen
Se documento y versiono la estructura de base de datos con esquema general y scripts de migracion.

## Criterios de aceptacion
- Archivo de schema SQL agregado.
- Diagrama/modelo de base de datos documentado.
- Migraciones incluidas para cambios incrementales.

## Commits relacionados
- `0db43dc`

## Metadatos sugeridos
- Status: `Done`
- Labels: `database`, `docs`, `migrations`, `done`
- Priority: `P1`

---

# ISSUE 11 - Docs: historias, diagrama y mockups
## Resumen
Se actualizaron historias de usuario, diagrama de clases y mockups para reflejar el alcance real implementado.

## Criterios de aceptacion
- Historias de usuario alineadas al producto actual.
- Diagrama de clases actualizado.
- Mockups anexados como evidencia funcional.

## Commits relacionados
- `d037128`

## Metadatos sugeridos
- Status: `Done`
- Labels: `docs`, `uml`, `ux`, `done`
- Priority: `P1`

---

# ISSUE 12 - Infra: ignorar archivo .env del backend
## Resumen
Se mejoro la higiene del repositorio evitando versionar secretos de entorno de backend.

## Criterios de aceptacion
- `.gitignore` actualizado para excluir `.env`.
- `backend/.env` removido del tracking de Git.

## Commits relacionados
- `8b4b502`

## Metadatos sugeridos
- Status: `Done`
- Labels: `infra`, `security`, `git`, `done`
- Priority: `P1`

---

# ISSUE 13 - Docs: actualizacion de README principal
## Resumen
Se actualizo el README principal para mejorar presentacion, estructura y contexto del proyecto.

## Criterios de aceptacion
- Informacion principal del repositorio actualizada.
- Formato y contenido ajustados para lectura de evaluacion.

## Commits relacionados
- `2fccad6`
- `a28d226`

## Metadatos sugeridos
- Status: `Done`
- Labels: `docs`, `readme`, `done`
- Priority: `P2`
