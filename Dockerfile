FROM alpine

ENV PEN_VER 0.34.0
ENV PEN_URL http://siag.nu/pub/pen/pen-$PEN_VER.tar.gz
ENV PEN_DIR pen-$PEN_VER
ENV PEN_DEP build-base autoconf automake gcc make curl

ENV KCP_VER 20161222
ENV KCP_URL https://github.com/xtaci/kcptun/releases/download/v$KCP_VER/kcptun-linux-amd64-$KCP_VER.tar.gz

# build pen
RUN apk update && \
    apk upgrade && \
    apk add --update bash jq $PEN_DEP $KCP_DEP

RUN curl -sSL "$PEN_URL" | tar -xvz

WORKDIR "$PEN_DIR"
RUN aclocal && \
    automake --add-missing && \
    autoconf && \
    ./configure && \
    make install

# build kcpclient
RUN curl -sSL "$KCP_URL" | tar -xvzC /bin/

# clean build dependency
WORKDIR /
RUN rm -rf $PEN_DIR && \
    apk del --purge $PEN_DEP && \
    rm -rf /var/cache/apk/*

ADD init ./
ENTRYPOINT ./init