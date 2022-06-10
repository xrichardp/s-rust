## install plugin
url=$(wget -qO- https://api.github.com/repos/maskedeken/gost-plugin/releases/latest | grep -Eo 'https.*?linux-amd64.*?gz')
wget -q $url && tar xf *.tar.gz && mv linux-amd64/gost-plugin usr/local/bin && rm -rf *linux-amd64*
chmod a+x /usr/local/bin/gost-plugin
## start service
ssserver -s "0.0.0.0:${PORT}" -m "aes-256-gcm" -k "${PASSWORD}" --plugin gost-plugin --plugin-opts "server;mode=ws"