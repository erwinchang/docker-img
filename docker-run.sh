#!/bin/bash

#skip docker user
[ "${USER}" == "aosp" ] && exit 0

#skip docker source folder
[ -f ./Dockerfile ] && exit 0

dirx="${PWD:${#HOME}}"	                # remove /ssd2/workspace/erwin-hud/hud_bsp
dirx=${dirx#/}			                # remove /
ssdx="${dirx:0:4}"
name=$(echo "$dirx" | sed 's/\//./g')

mdir="/home/${USER}/$dirx"
uid=`id -u`
gid=`id -g`

#home is workdir
echo "docker run"
echo "-e WORK_DIR=/home/aosp"
echo "-e USER_ID=$uid -e GROUP_ID=$gid"
echo "-v $mdir:/home/aosp"
echo "-it --rm --name $name erwinchang/u1404 /bin/bash"
docker run -e WORK_DIR=/home/aosp -e TZ=Asia/Taipei -e USER_ID=$uid -e GROUP_ID=$gid -v $mdir:/home/aosp -it --rm --name $name erwinchang/u1404 /bin/bash
