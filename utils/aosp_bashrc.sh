#!/bin/bash

export TT_DWORK=${WORK_DIR}

echo ""
[ "${DOCKER_IMG}x" != "x" ] && echo "DOCKER_IMG:${DOCKER_IMG}"
[ "${DOCKER_TZ}x" != "x" ] && echo "DOCKER_TZ:${DOCKER_TZ}"
[ "${DOCKER_CC_CMD}x" != "x" ] && echo "DOCKER_CC_CMD:${DOCKER_CC_CMD}"
[ "${DOCKER_CC_DIR}x" != "x" ] && echo "DOCKER_CC_DIR:${DOCKER_CC_DIR}"

echo ""
if [ "${DOCKER_CC_DIR}x" != "x" -a "${DOCKER_CC_CMD}x" != "x" ]; then
    export CCACHE_DIR=${WORK_DIR}/${DOCKER_CC_DIR}
    ${WORK_DIR}/${DOCKER_CC_CMD} -M 5G

    if [ $? == 0 ]; then
        export USE_CCACHE=1
        echo "android cache enabled success"
        echo "cache path CCACHE_DIR:$CCACHE_DIR"
    else
        echo "android cacche off"
        echo "ex. export CCACHE_DIR=xx/xx and prebuilts/misc/linux-x86/ccache/ccache -M 5G && export USE_CCACHE=1"
    fi
else
    echo "android cacche off"
    echo "ex. export CCACHE_DIR=xx/xx and prebuilts/misc/linux-x86/ccache/ccache -M 5G && export USE_CCACHE=1"
fi


alias dwork='cd ${WORK_DIR}'
echo ""
echo "command list"
echo "dwork: cd workspace dir"
echo ""

#fix wget http://commondatastorage.googleapis.com/git-repo-downloads/repo repo-temp fail
#unable to access 'https://gerrit.googlesource.com/git-repo/': Problem with the SSL CA cert
git config --global --add http.sslVerify false

#Please use a locale setting which supports UTF-8 (such as LANG=en_US.UTF-8).
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

dwork
