FROM erwinchang/u1404:1.0.0

MAINTAINER Erwin "m9207216@gmail.com" 

#https://community.nxp.com/docs/DOC-330147
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y gparted git build-essential libncurses5 wget u-boot-tools zlib1g-dev ncurses-dev \
cmake libc-dev-armhf-cross pkg-config-arm-linux-gnueabihf build-essential checkinstall cmake \
pkg-config lzop libc6 libstdc++6 debootstrap qemu-user-static binfmt-support

RUN rm -rf /var/lib/apt/lists/*
