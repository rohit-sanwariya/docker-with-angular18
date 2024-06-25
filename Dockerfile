FROM node:lts-alpine AS build 
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build



FROM nginx:latest AS ngi
 
COPY /nginx.conf  /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist/docker-with-angular18/browser /usr/share/nginx/html

EXPOSE 80
