FROM i386/ubuntu

ARG deb

ADD ./install.sh /tmp/install.sh
ADD ./kerio.sh /usr/bin/kerio.sh
ADD http://cdn.kerio.com/dwn/control/control-8.5.3-3469/kerio-control-vpnclient-8.5.3-3469-linux.deb /tmp/kerio.deb
ADD ./configure-kerio.sh /usr/bin/configure-kerio.sh
ADD ./healthcheck.sh /usr/bin/healthcheck.sh

RUN apt-get update && apt-get install -y iproute2 openssl libuuid1 procps

RUN sh /tmp/install.sh

HEALTHCHECK --interval=1m --timeout=10s CMD /usr/bin/healthcheck.sh
ENTRYPOINT [ "/usr/bin/kerio.sh" ]
