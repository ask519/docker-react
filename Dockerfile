FROM node:14.18.3-alpine3.14 as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY src ./src
COPY public ./public
RUN npm run build

FROM nginx:1.21.5 as final
COPY --from=builder /app/build /usr/share/nginx/html