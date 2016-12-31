# kcpclient-with-balance-x86
use pen to balance kcp clients.
- pen version: 0.34.0
- kcpclient version: 2016-12-22

## How to use?
```
docker run -itd --privileged --restart=always --cap-add=NET_ADMIN --net=host -v /home/testpen:/home/kcp/ --name router_pen_kcpclient_1 dorrypizza/kcpclient-with-balance-x86
```