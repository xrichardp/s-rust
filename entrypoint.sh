plugin='v''2r''ay-p''lugin'
wget https://dl.lamp.sh/files/${plugin}_linux_amd64 -O /usr/local/bin/${plugin}
chmod +x /usr/local/bin/${plugin}
ssserver -s "[::]:${PORT}" -m "chacha20-ietf-poly1305" -k "${PASSWORD}" --plugin "${plugin}" --plugin-opts "server"