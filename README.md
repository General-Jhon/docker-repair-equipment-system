# RepairEquipment

## Ejecutar con Docker

Requisitos: Docker y Docker Compose.

```bash
cp .env.example .env
docker compose up --build -d
```

La aplicación queda disponible en <http://localhost:8080>. El puerto se puede
cambiar mediante `APP_PORT` en `.env`.

Credenciales iniciales (cámbialas en `.env` antes del primer arranque):

- Correo: `admin@taller.local`
- Contraseña: `Admin1234`

```bash
docker compose ps
docker compose logs -f
docker compose down
```

MySQL se inicializa desde `docs/schema.sql` y persiste en el volumen
`mysql_data`. Para eliminar también la base de datos: `docker compose down -v`.

No uses las contraseñas de ejemplo en producción.
