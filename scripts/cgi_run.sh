#!/bin/sh

CUR_PATH="$( cd -P "$( dirname "$0" )" && pwd )"
. $CUR_PATH/local_config.cfg

echo "run script"
echo "socket: $SOCKET"
echo "pid   : $PIDFILE"
echo "run   : $RUN_DIR"
echo "ve    : $VE_ACTIVATE"


# kill old instances
. $CUR_PATH/cgi_kill.sh

. $VE_ACTIVATE
cd $RUN_DIR
python manage.py runfcgi socket=$SOCKET method=prefork pidfile=$PIDFILE daemonize=true
chmod 777 $SOCKET

ps aux | grep ${SOCKET}