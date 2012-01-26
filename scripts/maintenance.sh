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


echo
echo "------------------------------------------------------------------"
echo "maintenance script   | base: $PROJECT_ROOT"
echo "script time          : $SCRIPT_TIME"
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



cd $RUN_DIR
pwd



# django tasks
. $VE_ACTIVATE

# python manage.py
python manage.py send_mail
python manage.py emit_notices
python manage.py retry_deferred
# python manage.py event_process

exit 1
