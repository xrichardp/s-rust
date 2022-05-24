VERSION=$(wget --no-check-certificate -qO- https://api.github.com/repos/shadowsocks/shadowsocks-rust/releases/latest | grep 'tag_name' | cut -d\" -f4)
SS_URL="https://github.com/shadowsocks/shadowsocks-rust/releases/download/${VERSION}/shadowsocks-${VERSION}.x86_64-unknown-linux-musl.tar.xz"
wget ${SS_URL} && tar xf *-linux-musl.tar.xz -C /usr/local/bin && rm *-linux-musl.tar.xz
wget https://dl.lamp.sh/files/v2ray-plugin_linux_amd64 -O /usr/local/bin/v2-plugin
chmod a+x /usr/local/bin/ssserver /usr/local/bin/v2-plugin

ssserver -s 0.0.0.0 -p ${PORT} -k ${PASSWORD} -m $METHOD --plugin v2-plugin --plugin-opts "server"