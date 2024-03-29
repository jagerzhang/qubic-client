FROM ubuntu:22.04
WORKDIR /opt
USER root

RUN apt-get update && \
    apt-get install --no-install-recommends libicu-dev vim curl iproute2 -y && \
    apt-get clean

ARG version=1.8.10
ENV package=qli-Client-${version}-Linux-x64.tar.gz

RUN curl -L -k -o $package https://dl.qubic.li/downloads/$package && \
    tar zxvf $package
 
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["./qli-Client", "-service"] 
