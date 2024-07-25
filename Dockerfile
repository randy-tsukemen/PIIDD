# Build stage
FROM node:16-alpine AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Final stage
FROM node:16-alpine
WORKDIR /app
COPY --from=builder /app/build /app
CMD ["node", "server.js"]
