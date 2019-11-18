FROM nginx:alpine
 
RUN apk update && apk add bash
COPY nginx.conf /etc/nginx/nginx.conf
COPY vip.htpasswd /etc/nginx/vip.htpasswd
