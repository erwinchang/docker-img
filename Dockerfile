FROM ubuntu:trusty-20180112
MAINTAINER Erwin "m9207216@gmail.com"

#https://github.com/sameersbn/docker-ubuntu/blob/14.04/Dockerfile
RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y vim.tiny wget sudo net-tools ca-certificates unzip apt-transport-https git \
 && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

#https://stackoverflow.com/questions/28721699/root-password-inside-a-docker-container
RUN echo "root:Docker!" | chpasswd

#bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

COPY utils/gitconfig /root/.gitconfig
COPY utils/ssh_config /root/.ssh/config
COPY utils/docker_entrypoint.sh /root/docker_entrypoint.sh
COPY utils/aosp_bashrc.sh /root/aosp_bashrc.sh
RUN mkdir -p /root/aosp
COPY utils/aosp/.bash_logout /root/aosp
COPY utils/aosp/.bashrc /root/aosp
COPY utils/aosp/.profile /root/aosp
RUN chmod +x /root/docker_entrypoint.sh
#ENTRYPOINT ["/root/docker_entrypoint.sh"]
