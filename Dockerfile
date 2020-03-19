FROM erwinchang/u1404:1.0.0

MAINTAINER Erwin "m9207216@gmail.com" 

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential make curl \
        python bison g++-multilib gcc-multilib flex zip unzip libxml2-utils \
        bsdiff gnupg gperf lib32ncurses5-dev libswitch-perl 

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y lib32z1 libc6-i386 \
    lib32stdc++6 lib32gcc1 lib32ncurses5 u-boot-tools uuid-dev zlib1g-dev liblzo2-dev

RUN rm -rf /var/lib/apt/lists/*

#install jvm
RUN mkdir -p  /usr/lib/jvm
ADD jdk1.6.0_45.tgz /usr/lib/jvm
RUN update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.6.0_45/bin/java" 1
RUN update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.6.0_45/bin/javac" 1
RUN update-alternatives --install "/usr/bin/javah" "javah" "/usr/lib/jvm/jdk1.6.0_45/bin/javah" 1
RUN update-alternatives --install "/usr/bin/javap" "javap" "/usr/lib/jvm/jdk1.6.0_45/bin/javap" 1
RUN update-alternatives --install "/usr/bin/javadoc" "javadoc" "/usr/lib/jvm/jdk1.6.0_45/bin/javadoc" 1
RUN update-alternatives --install "/usr/bin/jar" "jar" "/usr/lib/jvm/jdk1.6.0_45/bin/jar" 1

#patch aosp_bashrc.sh
COPY utils/aosp_bashrc.sh /root/aosp_bashrc.sh
