FROM nginx:mainline-alpine-slim

ENV FIVEM_SERVER_IP 1.1.1.1
ENV FIVEM_SERVER_PORT 666
ENV FIVEM_PROXY_DOMAIN my.domain.com 
ENV FIVEM_PROXY_PORT 667

# backup original nginx.conf file
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak 

# copy files
COPY nginx.conf.template /etc/nginx/nginx.conf
COPY index.html /var/html/
COPY certificate.pem /
COPY private_key.pem /

# apply env of template into nginx.conf
RUN sed -i 's/FIVEM_SERVER_IP/${FIVEM_SERVER_IP}/g' /etc/nginx/nginx.conf
RUN sed -i 's/FIVEM_SERVER_PORT/${FIVEM_SERVER_PORT}/g' /etc/nginx/nginx.conf
RUN sed -i 's/FIVEM_PROXY_DOMAIN/${FIVEM_PROXY_DOMAIN}/g' /etc/nginx/nginx.conf
RUN sed -i 's/FIVEM_PROXY_PORT/${FIVEM_PROXY_PORT}/g' /etc/nginx/nginx.conf

EXPOSE 443
EXPOSE $FIVEM_PROXY_PORT