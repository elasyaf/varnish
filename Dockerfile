FROM ubuntu:latest
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install make automake autotools-dev libedit-dev libjemalloc-dev libncurses-dev \
    libpcre3-dev libtool pkg-config python3-docutils python3-sphinx graphviz git nano autoconf-archive && \
    git clone https://github.com/varnishcache/varnish-cache -b 6.1 /tmp/varnish && \
    cd /tmp/varnish && sh autogen.sh && sh configure && make && make install

COPY config/default.vcl /etc/varnish/
COPY start.sh /
COPY kill-varnish.sh /
RUN chmod +x /start.sh && chown root:root /start.sh
EXPOSE 6082 80 
ENTRYPOINT /start.sh