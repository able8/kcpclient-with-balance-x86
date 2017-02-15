# kcpclient-with-balance-x86
It starts one shadowsocks client, and no more than 4 `xtaci/kcptun` clients and uses `pen` to balance network flow, with config file `dorry_data/kcpclient/kcp1.json`, `/dorry_data/kcpclient/pen.json` and `/dorry_data/kcpclient/shadowsocks.json`.

[kcp config file format ](https://github.com/xtaci/kcptun/blob/master/README-CN.md)

[shadowsocks config file format](https://github.com/shadowsocks/shadowsocks/wiki/Configuration-via-Config-File)

##  Versions
 - shadowsocks: 2.5.6
 - kcptun: 20170120

## How to use?
```
docker run -itd --privileged --restart=always --cap-add=NET_ADMIN --net=host -v /dorry_data/kcpclient:/home/kcpclient --name router_kcp dorrypizza/kcpclient-with-balance-x86
```
