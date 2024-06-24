FROM node:22-alpine3.19 AS base
WORKDIR /app
COPY . .
ENV NODE_ENV=production
RUN npm run build

FROM nginx:1.27.0-alpine AS production

COPY ./default.conf.template /etc/nginx/templates/default.conf.template
COPY --from=development /app/dist /usr/share/nginx/html