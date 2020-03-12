#!/bin/bash

docker_img="erwinchang/u1604"

#skip docker user
[ "${USER}" == "aosp" ] && exit 0

#skip docker source folder
[ -f ./Dockerfile ] && exit 0

docker_pwd="${PWD}"
dirx="${PWD:${#HOME}}"	                # remove /ssd2/workspace/erwin-hud/hud_bsp
dirx=${dirx#/}			                # remove /
ssdx="${dirx:0:4}"
name=$(echo "$dirx" | sed 's/\//./g')

mdir="/home/${USER}/$dirx"
uid=`id -u`
gid=`id -g`

#home is workdir
echo "docker run"
echo "-e DOCKER_PWD=$docker_pwd"
echo "-e DOCKER_IMG=$docker_img"
echo "-e WORK_DIR=/home/aosp"
echo "-e USER_ID=$uid -e GROUP_ID=$gid"
echo "-v $mdir:/home/aosp"
echo "-it --rm --name $name $docker_img /bin/bash"
docker run -e DOCKER_PWD=$docker_pwd \
        -e DOCKER_IMG=$docker_img \
        -e WORK_DIR=/home/aosp \
        -e TZ=Asia/Taipei \
        -e USER_ID=$uid \
        -e GROUP_ID=$gid \
        -v $mdir:/home/aosp -it --rm --name $name $docker_img /bin/bash
