FROM erwinchang/u1604:1.0.0
MAINTAINER Erwin "m9207216@gmail.com"

#https://github.com/Freescale/fsl-community-bsp-platform
#https://github.com/VNCAutomotive/yocto_imx6sabreauto_fsl-community-bsp-platform/tree/yardbird_jethro


RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gawk wget git-core diffstat unzip texinfo gcc-multilib \
    build-essential chrpath socat libsdl1.2-dev \
    u-boot-tools curl

#https://stackoverflow.com/questions/43621584/why-cant-i-install-python3-6-dev-on-ubuntu16-04
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common \
 && DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:deadsnakes/ppa \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y python3.6

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y cpio file

#for VNCAutomotive-CobaltLinkPlus-LinuxViewer build
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xutils-dev autoconf

RUN rm -rf /var/lib/apt/lists/*

