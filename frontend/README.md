# Frontend

Interfaz React de Repair Equipment, compilada con Vite y publicada mediante
Nginx.

## Responsabilidades

- Presentar los portales de administración, cliente, técnico y recepción.
- Consumir la API usando rutas relativas bajo `/api`.
- Entregar una SPA con fallback hacia `index.html`.
- Actuar como único punto de entrada publicado del sistema.

## Imagen Docker

Se utiliza construcción multietapa:

1. `build`: Node.js instala dependencias y genera `dist`.
2. Etapa final: Nginx recibe únicamente los archivos estáticos compilados.

Nginx escucha en el puerto no privilegiado 8080 y la imagen declara
`USER nginx`. El compilador, el código fuente y las dependencias de Node no
forman parte de la imagen final.

## Proxy inverso

Las solicitudes `/api` se envían a `http://backend:3001`. El navegador nunca
necesita conocer ni acceder directamente al backend.

## Desarrollo local

```bash
npm ci
npm run dev
```

Vite redirige `/api` a la API local mediante la configuración de
`vite.config.js`.
