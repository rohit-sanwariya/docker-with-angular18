FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
RUN npm cache clean --force
# Copy files from local machine to virtual directory in docker image
COPY . .
RUN npm install
RUN npm run build --prod



FROM nginx:latest AS ngi

COPY --from=build /dist/src/app/dist/my-docker-angular-app /usr/share/nginx/html
COPY /nginx.conf  /etc/nginx/conf.d/default.conf
 
EXPOSE 80
