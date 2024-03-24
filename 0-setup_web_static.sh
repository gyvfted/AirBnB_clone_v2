#!/usr/bin/env bash
<<<<<<< HEAD
# Sets up your web server for deployment of web_static.
=======
# Seting up a web server for deployment of web_static.
>>>>>>> 3b3b1f8804504db7ad5abcfc705c9d37d3c3b6a9

apt-get update
apt-get install -y nginx

mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/
echo "Hello World" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current

chown -R ubuntu /data/
chgrp -R ubuntu /data/

printf %s "server {
    listen 80 default_server;
    listen [::]:80 default_server;
    add_header X-Served-By $HOSTNAME;
    root   /var/www/html;
    index  index.html index.htm;

    location /hbnb_static {
        alias /data/web_static/current;
        index index.html index.htm;
    }

    location /redirect_me {
<<<<<<< HEAD
        return 301 http://celestialuganda.com/;
=======
        return 301 http://cuberule.com/;
>>>>>>> 3b3b1f8804504db7ad5abcfc705c9d37d3c3b6a9
    }

    error_page 404 /404.html;
    location /404 {
      root /var/www/html;
      internal;
    }
}" > /etc/nginx/sites-available/default

service nginx restart
