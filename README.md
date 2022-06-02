# ss-rust

## Depoly to Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

### Where can I get the information of free dyno ?

https://www.heroku.com/pricing

free dyno: 512m RAM, 550 hours runtime per month(Sleeps after 30 mins of inactivity)

### How do I monitor my free dyno hours quota ?

https://dashboard.heroku.com/account/billing

## Depoly to Railway

$5 credit granted monthly

512 MB RAM

and shared CPU / container

1 GB Disk

Limited to $5 of usage

Deploys shut off when limit is reached

100 GB outbound network bandwidth

Unlimited inbound network bandwidth

Multiple custom domains with SSL

## Usage

encrypt method: chacha20-ietf-poly1305

port: 443

plugin-opts: tls;host=mydomain.com

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
