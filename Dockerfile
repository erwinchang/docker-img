FROM erwinchang/u1604:1.0.0

MAINTAINER Erwin "m9207216@gmail.com"

RUN apt-get update \
 && apt-get install -y curl

#https://websiteforstudents.com/install-hexo-cms-node-js-on-ubuntu-16-04-18-04/
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - \
 && apt-get install -y nodejs
