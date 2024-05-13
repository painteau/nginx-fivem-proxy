#!/usr/bin/env sh
set -eu
wget -O /origin_ca_ecc_root.pem https://developers.cloudflare.com/ssl/static/origin_ca_ecc_root.pem
sed -i "s/FIVEM_SERVER_IP/${FIVEM_SERVER_IP}/g" /etc/nginx/nginx.conf
sed -i "s/FIVEM_SERVER_PORT/${FIVEM_SERVER_PORT}/g" /etc/nginx/nginx.conf
sed -i "s/FIVEM_PROXY_DOMAIN/${FIVEM_PROXY_DOMAIN}/g" /etc/nginx/nginx.conf
sed -i "s/FIVEM_PROXY_PORT/${FIVEM_PROXY_PORT}/g" /etc/nginx/nginx.conf
cat /certificate.pem /origin_ca_ecc_root.pem > /combine.pem 