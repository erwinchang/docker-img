FROM erwinchang/u1804:1.0.0
MAINTAINER Erwin "m9207216@gmail.com"

#https://jumpnowtek.com/rpi/Raspberry-Pi-Systems-with-Yocto.html
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential chrpath diffstat gawk libncurses5-dev python3-distutils texinfo

#https://linuxconfig.org/install-python-2-on-ubuntu-18-04-bionic-beaver-linux
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python-minimal

#fix build error
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    cpio file

RUN rm -rf /var/lib/apt/lists/*
