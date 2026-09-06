FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY src ./src
COPY scripts ./scripts
ENV NODE_ENV=production
EXPOSE 3001
CMD ["sh", "-c", "node scripts/seedAdmin.js && exec node src/server.js"]
