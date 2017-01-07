FROM alpine

ENV PEN_VER 0.34.0
ENV PEN_URL http://siag.nu/pub/pen/pen-$PEN_VER.tar.gz
ENV PEN_DIR pen-$PEN_VER
ENV PEN_DEP build-base autoconf automake gcc make curl

ENV KCP_VER 20161222
ENV KCP_URL https://github.com/xtaci/kcptun/releases/download/v$KCP_VER/kcptun-linux-amd64-$KCP_VER.tar.gz

ENV SS_VER 2.4.6
ENV SS_URL https://github.com/shadowsocks/shadowsocks-libev/archive/v$SS_VER.tar.gz
ENV SS_DIR shadowsocks-libev-$SS_VER
ENV SS_DEP autoconf build-base libtool linux-headers openssl-dev

# setup build environment
RUN apk update && \
    apk upgrade && \
    apk add --update bash python $PEN_DEP $SS_DEP

# build pen
RUN curl -sSL "$PEN_URL" | tar -xvz

WORKDIR "$PEN_DIR"
RUN aclocal && \
    automake --add-missing && \
    autoconf && \
    ./configure && \
    make install

WORKDIR /
# build shadowsocks-libev
RUN curl -sSL "$SS_URL" | tar -xvz

WORKDIR "$SS_DIR"
RUN ./configure && \
    make install

# build kcpclient
RUN curl -sSL "$KCP_URL" | tar -xvzC /bin/

# clean build dependency
WORKDIR /
RUN rm -rf $PEN_DIR && \
    rm -rf $SS_DIR && \
    apk del --purge $SS_DEP && \
    apk del --purge $PEN_DEP && \
    rm -rf /var/cache/apk/*

ADD init ./
ENTRYPOINT ./init
