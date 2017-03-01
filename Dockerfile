FROM alpine

ENV PEN_VER 0.34.1
ENV PEN_URL http://siag.nu/pub/pen/pen-$PEN_VER.tar.gz
ENV PEN_DIR /pen-$PEN_VER
ENV PEN_DEP build-base autoconf automake gcc make

ENV KCP_VER 20170301
ENV KCP_URL https://github.com/xtaci/kcptun/releases/download/v$KCP_VER/kcptun-linux-amd64-$KCP_VER.tar.gz

ENV SS_VER 2.5.6
ENV SS_URL https://github.com/shadowsocks/shadowsocks-libev/archive/v$SS_VER.tar.gz
ENV SS_DIR /shadowsocks-libev-$SS_VER
ENV SS_DEP autoconf build-base libtool linux-headers asciidoc xmlto zlib-dev

RUN apk update && \
    apk upgrade && \
    apk add --update bash curl python openssl-dev && \
    # get kcpclient
    curl -sSL "$KCP_URL" | tar -xvzC /bin/ && \
    # get shadowsocks-libev
    curl -sSL "$SS_URL" | tar -xzv && \
    # get pen
    curl -sSL "$PEN_URL" | tar -xvz && \
    apk del --purge curl

# build shadowsocks-libev
WORKDIR "$SS_DIR"
RUN apk add --update $SS_DEP pcre-dev && \
    ./configure && \
    make && \
    make install && \
    # clear build dependency
    apk del --purge $SS_DEP

# build pen
WORKDIR "$PEN_DIR"
RUN apk add --update $PEN_DEP && \
    aclocal && \
    automake --add-missing && \
    autoconf && \
    ./configure && \
    make install && \
    # clear build dependency
    apk del --purge $PEN_DEP && \
    rm -rf /var/cache/apk/*

# clean build dependency
WORKDIR /
RUN rm -rf $PEN_DIR && \
    rm -rf $SS_DIR

ADD init ./
ENTRYPOINT ./init
