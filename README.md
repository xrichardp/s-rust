# ss-rust

## Depoly

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

### Where can I get the information of free dyno ?

https://www.heroku.com/pricing

free dyno: 512m RAM, 550 hours runtime per month(sleep after 30 mins of inactivity)

### How do I monitor my free dyno hours quota ?

https://dashboard.heroku.com/account/billing

## Usage

port: 443

encrypt method: aes-256-gcm

plugin-opts: ck-client.json

`ck-client.json` should be configured as below:

```
{
  "Transport": "cdn",
  "ProxyMethod": "shadowsocks",
  "EncryptionMethod": "plain",
  "UID": "cloak uid",
  "PublicKey": "cloak publickey",
  "ServerName": "app-name.herokuapp.com",
  "NumConn": 4,
  "BrowserSig": "chrome",
  "StreamTimeout": 300
}
```

### How do I use it with cloudflare proxy ?

use it with workers, and just copy the code as below and paste it to your worker

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

use it with pages, and just copy the code as below to a file named `_worker.js` and upload it to your pages

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
