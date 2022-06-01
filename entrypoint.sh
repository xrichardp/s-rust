## install shadowsocks-rust
VERSION=$(wget --no-check-certificate -qO- https://api.github.com/repos/shadowsocks/shadowsocks-rust/releases/latest | grep 'tag_name' | cut -d\" -f4)
SS_URL="https://github.com/shadowsocks/shadowsocks-rust/releases/download/${VERSION}/shadowsocks-${VERSION}.x86_64-unknown-linux-musl.tar.xz"
wget -q ${SS_URL} && tar xf *-linux-musl.tar.xz -C /usr/local/bin
## install v2ray-plugin
wget https://dl.lamp.sh/files/v2ray-plugin_linux_amd64 -O /usr/local/bin/v2ray-plugin
chmod a+x /usr/local/bin/ssserver /usr/local/bin/v2ray-plugin
## start service
ssserver -s "[::]:${PORT}" -m $METHOD -k ${PASSWORD} --plugin v2ray-plugin --plugin-opts "server"