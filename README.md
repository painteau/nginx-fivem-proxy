# 🚀 nginx-fivem-proxy

## 📖 Overview

`nginx-fivem-proxy` is a lightweight container based on the official Alpine Nginx image, designed to act as a reverse proxy for your FiveM server. It allows you to securely expose your FiveM server with HTTPS support and caching capabilities.

## ⭐ Features

- **Reverse Proxy**: Forward traffic from a public domain to your FiveM server.
- **HTTPS Support**: Secure connections with SSL/TLS certificates.
- **Static File Hosting**: Serve additional resources via Nginx.
- **Configurable Caching**: Reduce latency and improve performance.
- **Lightweight & Efficient**: Based on Alpine Linux for minimal resource usage.

## 🛠 Usage

### ▶ Running the Container

You can start the container using the following command:

```bash
docker run -d --name nginx-fivem-proxy \
    --restart unless-stopped \
    -e FIVEM_SERVER_IP="100.100.100.100" \
    -e FIVEM_SERVER_PORT="30120" \
    -e FIVEM_PROXY_DOMAIN="my.domain.com" \
    -e FIVEM_PROXY_PORT="30130" \
    -v /my/html/files/:/var/www/:ro \
    -v /my/log/files/nginx_error.log:/nginx_error.log \
    -v /srv/cache/:/srv/cache/ \
    -v /my.certificate.pem:/certificate.pem:ro \
    -v /my.private_key.pem:/private_key.pem:ro \
    -p 30130:30120 \
    -p 443:443 \
    ghcr.io/painteau/nginx-fivem-proxy:latest
```

### ⚙ Configuration

- **FIVEM_SERVER_IP**: The IP address of your FiveM server.
- **FIVEM_SERVER_PORT**: The port your FiveM server is running on (default: `30120`).
- **FIVEM_PROXY_DOMAIN**: The domain name used to access the proxy.
- **FIVEM_PROXY_PORT**: The external port for the proxy (default: `30130`).
- **Volumes**:
  - `/var/www/` : Directory for serving static files.
  - `/nginx_error.log` : Log file for Nginx errors.
  - `/srv/cache/` : Cache directory.
  - `/certificate.pem` & `/private_key.pem` : SSL/TLS certificate and private key (required for HTTPS support).

### 🌍 Accessing the Proxy

Once the container is running, you can access your FiveM server through:

```
https://my.domain.com
```

Ensure that your domain is correctly configured with the appropriate DNS records pointing to your proxy server.

## ⚠ Security Notice

🚨 **DO NOT use the default certificates included in the repository!** They are only provided as an example. Always use your own SSL certificates.

## 📜 License

This project is open-source and licensed under the MIT License.

## 🤝 Contributing

Contributions are welcome! If you'd like to improve this project, please follow these steps:

1. Fork the repository.
2. Create a new branch (`feature-branch`).
3. Commit your changes.
4. Push to your branch and create a pull request.

For major changes, please open an issue first to discuss what you would like to change.


