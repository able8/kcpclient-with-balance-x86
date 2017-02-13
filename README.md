# kcpclient-with-balance-x86
It starts one shadowsocks client, and no more than 4 `xtaci/kcptun` clients and uses `pen` to balance network flow, with config file `/dorry_data/kcpclient/config.json` and `/dorry_data/kcpclient/shadowsocks.json`.

## shadowsocks Versions
  - 2.5.6
  - 2.4.6

## kcptun Versions
  - 20170120
  - 20161222
  - 20161207

## How to use?
```
docker run -itd --privileged --restart=always --cap-add=NET_ADMIN --net=host -v /dorry_data/kcpclient:/home/kcpclient --name router_kcp dorrypizza/kcpclient-with-balance-x86
```
