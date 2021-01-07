FROM erwinchang/u1404:1.0.0
MAINTAINER Erwin "m9207216@gmail.com"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential make curl \
	python bison g++-multilib gcc-multilib flex zip unzip libxml2-utils \
	bsdiff gnupg gperf lib32ncurses5-dev libswitch-perl

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y lib32z1 libc6-i386 \
	lib32stdc++6 lib32gcc1 lib32ncurses5 u-boot-tools uuid-dev zlib1g-dev liblzo2-dev

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gawk bc libbsd-dev fakeroot cpio bsdmainutils

#for VNCAutomotive
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xutils-dev

RUN DEBIAN_FRONTEND=noninteractive rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US en_US.UTF-8
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

RUN mv /usr/bin/make /usr/bin/make-3.81
COPY utils/make /usr/bin/make
RUN chmod +x /usr/bin/make
