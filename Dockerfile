FROM node:12 AS builder
WORKDIR /app
COPY trojan-panel /app/
RUN cd /app && npm install && npm run prod

FROM php:7-fpm-alpine
WORKDIR /app
COPY trojan-panel /app/
COPY --from=builder /app/dist /app/dist/
