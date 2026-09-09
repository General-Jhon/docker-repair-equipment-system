# Postura de seguridad

## Activos protegidos

- Credenciales y hashes de usuarios.
- Información de clientes, equipos, órdenes y pagos.
- Secreto usado para firmar tokens JWT.
- Integridad y disponibilidad de MySQL.

## Superficie expuesta

Solo el puerto 8080 del frontend se publica al host. Los puertos 3001 del
backend y 3306 de MySQL no tienen mapeos. La red interna `backend_net` limita
el acceso a la base de datos.

## Controles aplicados

### Menor privilegio

- El backend declara `USER node`.
- El frontend declara `USER nginx` y escucha en 8080, un puerto no
  privilegiado.
- Compose aplica `no-new-privileges:true` a los tres servicios.

La imagen oficial de MySQL necesita iniciar su entrypoint con los permisos
definidos por el proveedor y después ejecuta el servidor con el usuario
`mysql`.

### Secretos

- Los Dockerfiles no contienen credenciales.
- Los contextos excluyen `.env` y variantes mediante `.dockerignore`.
- Git ignora los archivos `.env`.
- `.env.example` contiene únicamente valores de desarrollo o marcadores.
- Las variables se inyectan cuando se crea el contenedor y no durante
  `docker build`.

Las credenciales predeterminadas son solo para demostración y deben cambiarse
antes de cualquier despliegue compartido.

### Segmentación

- `frontend_net`: comunicación entre Nginx y Express.
- `backend_net`: comunicación entre Express y MySQL; está marcada como
  interna.
- Frontend y MySQL no comparten ninguna red.

### Disponibilidad

Los healthchecks impiden avanzar en la cadena de arranque si una dependencia no
está realmente disponible. El volumen nombrado evita perder datos al recrear
contenedores.

## Validación

```bash
./scripts/verify-docker.sh
```

El script valida:

- Respuesta del frontend y de `/api/health`.
- Ausencia de puertos publicados para backend y MySQL.
- Usuarios no root del frontend y backend.
- Membresía correcta de cada red.

## Riesgos conocidos

- No hay TLS; la demostración usa HTTP local.
- Los valores de desarrollo no son aptos para producción.
- CORS es permisivo en la API.
- No hay rate limiting ni bloqueo por intentos fallidos.
- Los paquetes npm deben auditarse y actualizarse regularmente.
- El volumen local no reemplaza una estrategia de copias de seguridad.
- El almacenamiento S3 solicitado en el documento de entrega queda fuera del
  alcance acordado para esta versión.

## Recomendaciones para producción

1. Terminar TLS en un proxy o balanceador.
2. Guardar secretos en Docker Secrets o un gestor externo.
3. Restringir CORS al dominio autorizado.
4. Agregar rate limiting, encabezados de seguridad y registros centralizados.
5. Escanear imágenes y dependencias en CI.
6. Automatizar migraciones y copias de seguridad.
7. Usar imágenes fijadas por digest para despliegues inmutables.
