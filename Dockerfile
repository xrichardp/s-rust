FROM alpine:latest

COPY entrypoint.sh /opt/entrypoint.sh

RUN VERSION=$(wget --no-check-certificate -qO- https://api.github.com/repos/shadowsocks/shadowsocks-rust/releases/latest | grep 'tag_name' | cut -d\" -f4) && \
    SS_URL="https://github.com/shadowsocks/shadowsocks-rust/releases/download/${VERSION}/shadowsocks-${VERSION}.x86_64-unknown-linux-musl.tar.xz" && \
    wget -q ${SS_URL} && tar xf *.tar.xz -C /usr/local/bin && rm *.tar.xz && \
    chmod +x /opt/entrypoint.sh /usr/local/bin/ss*

ENTRYPOINT ["sh", "-c", "/opt/entrypoint.sh"]