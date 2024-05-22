# nginx-fivem-proxy

This container takes official alpine nginx image and turns on a proxy server for your fivem server.

You can do a simple mount to simply serve files from your local
file system with nginx.  Make sure to map the directory you want to serve from with the
`-v` command

Also, don't forget to map your certificate. I gave a dumb certificate and a private key JUST FOR THE EXEMPLE. DON'T USE THEM

```bash
docker run -d --name nginx-fivem-proxy \
	--restart unless-stopped \
	-e FIVEM_SERVER_IP="100.100.100.100" \
	-e FIVEM_SERVER_PORT="30120" \
	-e FIVEM_PROXY_DOMAIN="my.domain.com" \
	-e FIVEM_PROXY_PORT="30130" \
	-v /my/html/files/:/var/www/:ro \
	-p 30130:30120 \
	-p 443:443 \
	-v /srv/cache/:/srv/cache/ \
	-v /my.certificate.pem:/certificate.pem:ro \
	-v /my.private_key.pem:/private_key.pem:ro \
	ghcr.io/painteau/nginx-fivem-proxy:latest
```

Then navigate in a browser to https://your.proxy.domain and enjoy
