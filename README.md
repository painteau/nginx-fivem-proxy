# 🚀 nginx-fivem-proxy

## ⭐ Features

- 🔄 **Reverse Proxy**: Forward traffic from a public domain to your FiveM server.
- 🔒 **HTTPS Support**: Secure connections with SSL/TLS certificates.
- 📂 **Static File Hosting**: Serve additional resources via Nginx.
- ⚡ **Configurable Caching**: Reduce latency and improve performance.
- 🛠️ **Lightweight & Efficient**: Based on Alpine Linux for minimal resource usage.

## 📌 Prerequisites

- A FiveM server running and accessible.
- A valid domain name for HTTPS setup.
- SSL/TLS certificates for secure connections.
- Docker installed on your server.

## 🔨 Running nginx-fivem-proxy Locally

To build and test the container locally:

```bash
docker build -t nginx-fivem-proxy .
docker run -d --name nginx-fivem-proxy \
    -e FIVEM_SERVER_IP="127.0.0.1" \
    -e FIVEM_SERVER_PORT="30120" \
    -p 30130:30120 \
    nginx-fivem-proxy
```

## 🐳 Running with Docker (GHCR)

`nginx-fivem-proxy` is available on GitHub Container Registry (GHCR):

```bash
docker run -d --name nginx-fivem-proxy \
    --restart unless-stopped \
    -e FIVEM_SERVER_IP="100.100.100.100" \
    -e FIVEM_SERVER_PORT="30120" \
    -e FIVEM_PROXY_DOMAIN="my.domain.com" \
    -e FIVEM_PROXY_PORT="30130" \
    -v /home/nginx-fivem-proxy/html/:/var/www/:ro \
    -v /home/nginx-fivem-proxy/logs/nginx_error.log:/nginx_error.log \
    -v /home/nginx-fivem-proxy/cache/:/srv/cache/ \
    -v /home/nginx-fivem-proxy/certs/certificate.pem:/certificate.pem:ro \
    -v /home/nginx-fivem-proxy/certs/private_key.pem:/private_key.pem:ro \
    -p 30130:30120 \
    -p 443:443 \
    --label com.centurylinklabs.watchtower.enable=true \
    ghcr.io/painteau/nginx-fivem-proxy:latest
```

## ⚙ Configuration

| Environment Variable | Description                              | Default Value      |
| -------------------- | ---------------------------------------- | ------------------ |
| `FIVEM_SERVER_IP`    | The IP address of your FiveM server      | `127.0.0.1`        |
| `FIVEM_SERVER_PORT`  | The port your FiveM server is running on | `30120`            |
| `FIVEM_PROXY_DOMAIN` | The domain name used to access the proxy | `my.domain.com`    |
| `FIVEM_PROXY_PORT`   | The external port for the proxy          | `30130`            |
| `CACHE_DIR`          | Cache directory location                 | `/srv/cache/`      |
| `SSL_CERT`           | Path to SSL certificate                  | `/certificate.pem` |
| `SSL_KEY`            | Path to SSL private key                  | `/private_key.pem` |

## 🔧 Troubleshooting

- **Check logs:** Run `docker logs nginx-fivem-proxy` to inspect logs.
- **Verify ports:** Ensure ports `30120` and `443` are open.
- **DNS Setup:** Confirm your domain points to the correct server.
- **SSL Issues:** Ensure certificates are properly mounted.

## 📜 License

This project is licensed under the MIT License.

## ⚠ Security Notice

🚨 **DO NOT use the default certificates included in the repository!** They are only provided as an example. Always use your own SSL certificates.

## 💡 Contributing

1️⃣ **Fork the repository on GitHub:** [https://github.com/painteau/nginx-fivem-proxy](https://github.com/painteau/nginx-fivem-proxy)
2️⃣ **Create a new branch (`feature-branch`)**
3️⃣ **Commit your changes**
4️⃣ **Push to your branch and create a pull request**

For major changes, please open an issue first to discuss the proposed modifications.

