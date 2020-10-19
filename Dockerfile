FROM alpine:3.9

LABEL tags="latest"

RUN apk -U upgrade \
    && apk add -U --no-cache openssl util-linux strongswan sqlite bash \
    && rm -rf /var/cache/apk/* \
    && rm -f /etc/ipsec.secrets

ADD ./build/etc/* /etc/
ADD ./build/bin/* /usr/bin/

EXPOSE 500/udp 4500/udp

CMD /usr/bin/start-vpn
