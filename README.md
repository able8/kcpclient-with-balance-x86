# kcpclient-with-balance-x86
[kcp config file format ](https://github.com/xtaci/kcptun/blob/master/README-CN.md)

[shadowsocks config file format](https://github.com/shadowsocks/shadowsocks/wiki/Configuration-via-Config-File)

##  Versions
 - shadowsocks: 3.0.3
 - kcptun: 20170322

## How to use?

### Fetch the code
```
git clone git@github.com:LaoLuMian/kcpclient-with-balance-x86.git
```

### Modify configuration of ss, kcp, pen
```
vim config-1080.json
```

### Run
```
./kcp-control start 1080
```

### Stop
```
./kcp-control stop 1080
```

### Restart
```
./kcp-control restart 1080
```
