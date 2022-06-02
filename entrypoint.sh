## install plugin
wget https://github.com/maskedeken/gost-plugin/releases/download/v1.6.1/gost-plugin_linux_amd64-1.6.1.zip -qO plugin.zip
unzip plugin.zip -oqd /usr/local/bin
chmod a+x /usr/local/bin/gost-plugin
## start service
ssserver -s "0.0.0.0:${PORT}" -m "chacha20-ietf-poly1305" -k "${PASSWORD}" --plugin gost-plugin --plugin-opts "server;mode=ws"