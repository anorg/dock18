#!/bin/sh
# Platform Install-Script
#
# Author: Jonas Ohrstrom
#
# use at your own risk. can lead to big data loss if not configured propperly
# (eg it could delete / when using wrong settings...)
#

CONFIG_PATH=`dirname $0`
. $CONFIG_PATH/local_config.cfg

CUR_PATH=${PROJECT_ROOT}scripts/

SCRIPT_TIME=$(date +%Y%m%d%H%M%S)


WOWZA_DIR=/usr/local/WowzaMediaServer/
WOWZA_CONFIG_DIR=${PROJECT_ROOT}server/streaming/conf/
WOWZA_APP_DIR=${PROJECT_ROOT}server/streaming/applications/

echo
echo "------------------------------------------------------------------"
echo "rtmp server update script  : $PROJECT_ROOT"
echo "wowza dir                  : $WOWZA_DIR"
echo "wowza config dir           : $WOWZA_CONFIG_DIR"
echo "wowza applications dir     : $WOWZA_APP_DIR"
echo "script time                : $SCRIPT_TIME"
echo "------------------------------------------------------------------"
echo 




if [ "$(id -u)" != "0" ]; then
   echo "! ROOT please!" 1>&2
   exit 1
fi

if [ ! -d "$PROJECT_ROOT" ]; then
    echo
	echo 'Could not find the given path.' 1>&2
	echo
   exit 1
fi


cp -R ${WOWZA_CONFIG_DIR}* ${WOWZA_DIR}conf/
cp -R ${WOWZA_APP_DIR}* ${WOWZA_DIR}applications/



ls -l

echo
echo
echo

exit 1