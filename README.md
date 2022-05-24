[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

You can use the v2ray-plugin + ss client, the plug-in method is websocket-tls, the port is 443

## Tips

### Where can I get the information of free dyno ?

https://www.heroku.com/pricing

free dyno: 512m RAM, 550 hours runtime per month(Sleeps after 30 mins of inactivity)

### How do I monitor my free dyno hours quota ?

https://dashboard.heroku.com/account/billing

### How do I use it with clash cilent ?

```
  - name: app-name
    type: ss
    server: app-name.herokuapp.com
    port: 443
    cipher: chacha20-ietf-poly1305
    password: your-password
    plugin: v2ray-plugin
    plugin-opts:
      tls: true
      mode: websocket
      host: app-name.herokuapp.com
```

### How do I use it with cloudflare worker proxy ?

```
addEventListener(
  'fetch',event => {
     let url=new URL(event.request.url);
     url.hostname='app-name.herokuapp.com';
     let request=new Request(url,event.request);
     event.respondWith(fetch(request))
  }
)
```

## Reference

https://github.com/shadowsocks/shadowsocks-rust

https://github.com/teddysun/shadowsocks_install/tree/master
