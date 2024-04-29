#!/usr/bin/env bash
#setup inital server conf
if [ ! -x /usr/sbin/nginx ]; then
        apt-get update
        apt-get install nginx -y
fi
mkdir -p /data/web_static/shared/ /data/web_static/releases/test/
echo "fake content" | sudo tee /data/web_static/releases/test/index.html
ln -nsf /data/web_static/releases/test/ /data/web_static/current
chown ubuntu:ubuntu -R /data/
sed -i '72i\\tlocation /hbnb_static/ {\n\talias /data/web_static/current/;\n\t}' /etc/nginx/sites-enabled/default
service nginx restart
