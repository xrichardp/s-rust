# ss-rust

Depoly shadowsocks-rust with websocket plugin, such as v2-plugin, to heroku.

## Depoly

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

### Where can I get the information of free dyno ?

https://www.heroku.com/pricing

free dyno: 512m RAM, 550 hours runtime per month(sleep after 30 mins of inactivity)

### How do I monitor my free dyno hours quota ?

https://dashboard.heroku.com/account/billing

## Usage

configure your ss-client as below

```
server: app-name.herokuapp.com

port: 443

encrypt method: aes-256-gcm

plugin: v2-plugin

plugin-opts: tls;host=app-name.herokuapp.com
```

### How do I use it with cloudflare proxy ?

use it with cloudflare workers, and just copy the code as below and paste it to your worker

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

use it with cloudflare pages, and just copy the code as below to a file named `_worker.js` and upload it to your cloudflare pages

```
export default {
    async fetch(request) {
      let url=new URL(request.url);
      url.hostname='app-name.herokuapp.com';
      let new_request=new Request(url, request);
      return fetch(new_request);
    }
};
```

## Reference

https://github.com/shadowsocks/shadowsocks-rust

https://github.com/teddysun/shadowsocks_install/tree/master
