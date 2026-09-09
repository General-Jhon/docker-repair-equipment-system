# Backend

API REST de Repair Equipment construida con Node.js y Express.

## Responsabilidades

- Autenticación y autorización mediante JWT.
- Gestión de clientes, equipos, técnicos, usuarios y órdenes.
- Consulta y actualización de información en MySQL.
- Creación idempotente del usuario administrador al iniciar.
- Endpoint de salud que comprueba también la base de datos.

## Variables

Las variables requeridas están documentadas en `.env.example`. En Docker
Compose se inyectan desde el archivo `.env` de la raíz. El archivo real no se
copia a la imagen.

## Imagen Docker

La imagen utiliza dos etapas:

1. `dependencies`: instala únicamente dependencias de producción con
   `npm ci --omit=dev`.
2. `runtime`: copia dependencias y código con propietario `node`.

La etapa final ejecuta `USER node`, por lo que la API no funciona como root.
El puerto 3001 se usa solo dentro de las redes Docker y no se publica al host.

## Desarrollo local

```bash
npm ci
cp .env.example .env
npm run dev
```

## Salud

```text
GET /api/health
```

Una respuesta `200` confirma que Express y MySQL están disponibles.
