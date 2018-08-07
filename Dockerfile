FROM fernandoenzo/debian:10s-min
MAINTAINER Fernando Enzo Guarini (fernandoenzo@gmail.com)

COPY scripts/basics /tmp
RUN bash /tmp/basics

COPY static/db.generic /etc/bind/
COPY static/named.conf.local /etc/bind/
COPY static/named.conf.options /etc/bind/

EXPOSE 53/udp

ENTRYPOINT rndc-confgen -a  > /dev/null 2>&1 ; service cron start > /dev/null 2>&1 ; service bind9 start > /dev/null 2>&1 ; /bin/bash
