FROM node:alpine as builder

WORKDIR '/app'

EXPOSE 80/tcp

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html