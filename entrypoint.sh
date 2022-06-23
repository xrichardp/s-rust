## install cloak
url='https://github.com/cbeuw/Cloak/releases/download/v2.6.0/ck-server-linux-amd64-v2.6.0'
wget $url -O /usr/local/bin/ck-server
chmod +x /usr/local/bin/ck-server
## setup cloak
cat << EOF > /opt/server.json
{
  "ProxyBook": {
    "shadowsocks": [
      "tcp",
      "127.0.0.1:9008"
    ]
  },
  "BindAddr": [
    ":${PORT}"
  ],
  "BypassUID": [
    "${UID}"
  ],
  "RedirAddr": "cloudflare.com",
  "PrivateKey": "${KEY}",
  "AdminUID": "${UID}",
  "DatabasePath": "userinfo.db"
}
EOF
## start service
ssserver -s "0.0.0.0:9008" -m "aes-256-gcm" -k "${PASSWORD}" --plugin "ck-server" --plugin-opts "/opt/server.json"