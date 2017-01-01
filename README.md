# kcpclient-with-balance-x86
It starts no more than 5 `xtaci/kcptun` clients and uses `pen` to make them looks as one, with config file `/dorry_data/kcpclient/config.json`.

## How to use?
```
docker run -itd --privileged --restart=always --cap-add=NET_ADMIN --net=host -v /dorry_data/kcpclient:/home/kcpclient --name router_kcp dorrypizza/kcpclient-with-balance-x86
```