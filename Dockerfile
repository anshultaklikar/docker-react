FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# Above part is only for building react app

# nginx is just like tomcat
FROM nginx
EXPOSE 80
# take build folder from the above container
COPY --from=builder /app/build /usr/share/nginx/html
