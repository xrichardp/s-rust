VERSION=$(wget --no-check-certificate -qO- https://api.github.com/repos/shadowsocks/shadowsocks-rust/releases/latest | grep 'tag_name' | cut -d\" -f4)
SS_URL="https://github.com/shadowsocks/shadowsocks-rust/releases/download/${VERSION}/shadowsocks-${VERSION}.x86_64-unknown-linux-musl.tar.xz"
wget -c ${SS_URL} -O - | tar xzC /usr/local/bin
wget https://dl.lamp.sh/files/v2ray-plugin_linux_amd64 -O /usr/local/bin/v2-plugin
chmod a+x /usr/local/bin/ss-server /usr/local/bin/v2-plugin

ss-server -s 0.0.0.0 -p ${PORT} -k ${PASSWORD} -m $METHOD --plugin v2-plugin --plugin-opts "server"