FROM busybox

ENV FRP_VERSION 0.24.1
RUN wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar -xf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && mkdir /frp \
    && cp frp_${FRP_VERSION}_linux_amd64/frp* /frp/ \
    && rm -rf frp_${FRP_VERSION}_linux_amd64*

RUN mkdir /conf
VOLUME /conf

WORKDIR /frp

ADD frp.sh /frp/

ENTRYPOINT ["/bin/sh", "frp.sh"]

CMD ["server"]