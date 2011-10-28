#!/bin/sh

CUR_PATH="$( cd -P "$( dirname "$0" )" && pwd )"
. $CUR_PATH/local_config.cfg

echo "run script"
echo "socket: $SOCKET"
echo "pid   : $PIDFILE"
echo "run   : $RUN_DIR"
echo "ve    : $VE_ACTIVATE"

echo "-----------------------------------------"
ps aux | grep ${SOCKET}
echo "-----------------------------------------"

exit 1