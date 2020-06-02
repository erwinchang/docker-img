FROM erwinchang/u1404:1.0.0
MAINTAINER Erwin "m9207216@gmail.com"

#http://freescale.github.io/doc/release-notes/2.2/index.html#document-bsp-scope
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gawk wget git-core diffstat unzip texinfo gcc-multilib \
    build-essential chrpath socat libsdl1.2-dev \
    u-boot-tools

RUN rm -rf /var/lib/apt/lists/*
