#!/bin/sh
# Platform Install-Script
#
# Copyright 2012, Jonas Ohrstrom  - ohrstrom@gmail.com
# See LICENSE.txt
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
echo "install script | base: $PROJECT_ROOT"
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



cd $PROJECT_ROOT


# virtualenv
if [ ! -d "$VE_BASE" ]; then
        echo "init virtualenv in: $VE_BASE"
    virtualenv --no-site-packages $VE_BASE
fi

# config dir
if [ ! -d "$CONFIG_DIR" ]; then
        echo "mkdir $CONFIG_DIR"
        mkdir $CONFIG_DIR
        ls -l $CONFIG_DIR
fi

# copy config files away
for i in `echo $CONFIG_SAVE`
do
    cp -p ${RUN_DIR}${i} ${CONFIG_DIR}${SCRIPT_TIME}_${i}
done


# remove app
rm -Rf ${REPO_DIR} 

# git clone ${GIT_URL} ${REPO_DIR} 
mkdir  ${REPO_DIR} 
cd ${REPO_DIR} 

git init
git remote add -t $GIT_BRANCH -f origin $GIT_URL
git checkout ${GIT_BRANCH}

cd $PROJECT_ROOT
pwd


# copy config files back
for i in `echo $CONFIG_SAVE`
do
    cp -p ${CONFIG_DIR}${SCRIPT_TIME}_${i} ${RUN_DIR}${i}
done

# link media directories
ln -s ${DATA_ROOT}media ${RUN_DIR}media
ls -l ${RUN_DIR}media

ln -s ${DATA_ROOT}smedia ${RUN_DIR}smedia
ls -l ${RUN_DIR}smedia


# django tasks
. $VE_ACTIVATE

# requirements
pip install -q -r ${RUN_DIR}requirements/requirements.txt


# info file
INFO_FILE=${RUN_DIR}static/info.txt
touch ${INFO_FILE}
echo "time       : $SCRIPT_TIME" >> $INFO_FILE
echo "source     : $GIT_URL | $GIT_BRANCH" >> $INFO_FILE
echo "run_dir    : $RUN_DIR" >> $INFO_FILE
echo "pidfile    : $PIDFILE" >> $INFO_FILE
echo "socket     : $SOCKET" >> $INFO_FILE
echo "virtualenv : $VE_BASE" >> $INFO_FILE



# start fcgi server
cd $RUN_DIR

# db / static
# python manage.py syncdb
python manage.py migrate
python manage.py collectstatic --verbosity=2 --noinput --ignore=2011

cd ${PROJECT_ROOT}scripts/


ls -l


supervisorctl restart ${APP_ID}
supervisorctl status 



echo
echo
echo
echo "------------------------------------------------------------------"
cat $INFO_FILE
echo "------------------------------------------------------------------"
echo
echo

exit 1
