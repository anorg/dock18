#!/bin/sh

CUR_PATH="$( cd -P "$( dirname "$0" )" && pwd )"


. $CUR_PATH/local_config.cfg

echo "kill script"
echo "socket: $SOCKET"
echo "pid   : $PIDFILE"
echo "run   : $RUN_DIR"

cd $RUN_DIR
if [ -f $PIDFILE ]; then
    kill `cat -- $PIDFILE`
    rm -f -- $PIDFILE
fi
cd $PROJECT_ROOT

