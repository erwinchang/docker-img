#!/bin/bash

#Exit immediately if a simple command exits with a non-zero status.
#set -e

[ "x$DOCKER_TZ" != "x" -a -f /usr/share/zoneinfo/$DOCKER_TZ ] && {
    ln -sf /usr/share/zoneinfo/$DOCKER_TZ /etc/localtime
}

[ "x$DOCKER_TZ" != "x" -a ! -f /usr/share/zoneinfo/$DOCKER_TZ ] && {
    echo ""
    echo "error: can't found /usr/share/zoneinfo/$DOCKER_TZ"
    echo ""
}

#https://github.com/kylemanna/docker-aosp/blob/master/utils/docker_entrypoint.sh 

# Reasonable defaults if no USER_ID/GROUP_ID environment variables are set.
if [ -z ${USER_ID+x} ]; then USER_ID=1000; fi
if [ -z ${GROUP_ID+x} ]; then GROUP_ID=1000; fi


msg="docker_entrypoint: Creating user UID/GID [$USER_ID/$GROUP_ID]" && echo $msg
groupadd -g $GROUP_ID -r aosp
if [ -d /home/aosp ]
then
    useradd -u $USER_ID -r -g aosp aosp
    [ ! -f /home/aosp/.bash_logout ] && {
        cp /root/aosp/.bash_logout /home/aosp
        chown aosp:aosp /home/aosp/.bash_logout
    }
    [ ! -f /home/aosp/.bashrc ] && {
        cp /root/aosp/.bashrc /home/aosp
        chown aosp:aosp /home/aosp/.bashrc
    }
    [ ! -f /home/aosp/.profile ] && {
        cp /root/aosp/.profile /home/aosp
        chown aosp:aosp /home/aosp/.profile
    }
else
    useradd -u $USER_ID --create-home -r -g aosp aosp
fi


cp /root/.gitconfig /home/aosp/.gitconfig
chown aosp:aosp /home/aosp/.gitconfig

cp /root/aosp_bashrc.sh /home/aosp/aosp_bashrc.sh
chown aosp:aosp /home/aosp/aosp_bashrc.sh
chmod +x /home/aosp/aosp_bashrc.sh

#if chk is empty then return value is 1 ($? is 1)
#and if set -e then will exit script
chk=$(cat /home/aosp/.bashrc | grep aosp_bashrc.sh)
[ "x$chk" == "x" ] && {
    echo ". /home/aosp/aosp_bashrc.sh" >> /home/aosp/.bashrc
}

echo "aosp:aosp!" | chpasswd

echo "$msg - done"
sudo adduser aosp sudo

export HOME=/home/aosp
exec sudo -E -u aosp /bin/bash
