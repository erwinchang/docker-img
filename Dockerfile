FROM erwinchang/u1404:1.0.0
MAINTAINER Erwin "m9207216@gmail.com"

#http://freescale.github.io/doc/release-notes/2.2/index.html#document-bsp-scope
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gawk wget git-core diffstat unzip texinfo gcc-multilib \
    build-essential chrpath socat libsdl1.2-dev \
    u-boot-tools curl

#imx-yocto-L4.14.98_2.0.0_ga.zip
#i.MX_Yocto_Project_User's_Guide.pdf
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libsdl1.2-dev xterm sed cvs subversion coreutils texi2html \
    docbook-utils python-pysqlite2 help2man make gcc g++ desktop-file-utils \
    libgl1-mesa-dev libglu1-mesa-dev mercurial autoconf automake groff curl lzop asciidoc

#https://stackoverflow.com/questions/43621584/why-cant-i-install-python3-6-dev-on-ubuntu16-04
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common \
 && DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:deadsnakes/ppa \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y python3.6


RUN rm -rf /var/lib/apt/lists/*
