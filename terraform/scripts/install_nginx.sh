#!/bin/bash
yum update -y
yum install nginx -y

cat <<EOF > /etc/nginx/nginx.conf
events {}

http {
  upstream backend {
    server ${backend_ip}:3000;
  }

  server {
    listen 80;

    location / {
      proxy_pass http://backend;
    }
  }
}
EOF

systemctl enable nginx
systemctl start nginx
