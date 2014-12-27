FROM debian:wheezy

RUN apt-get update
RUN apt-get -y install git gcc make re2c php5 php5-json php5-dev libpcre3-dev sudo
RUN cd; \
    git clone https://github.com/phalcon/zephir; \
    cd zephir; \
    ./install-json; \
    ./install -c;

WORKDIR /work
CMD ["zephir", "help"] 
