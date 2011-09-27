#!/bin/sh
# Platform Install-Script
#
# Author: Jonas Ohrstrom
#

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

######################################################
# path setup
######################################################
# SVN_URL=https://lab.digris.ch/svn/obp/trunk

SVN_URL=https://trac.anorg.net/svn_obp/platform/trunk

SITE_ROOT=/var/www/obp/trunk/
CONFIG_DIR=/root/obp/config/trunk/
HOST=web.trunk.obp.anorg.net
# instance: trunk/stage/prod
INSTANCE=trunk

INSTALL_TIME=$(date +%Y%m%d%H%M%S)

######################################################
# config files to keep
######################################################
CONFIG_SAVE="database local_config"

######################################################
# prepare update
######################################################
cd ${SITE_ROOT}

######################################################
# make config dirs
######################################################
mkdir -p ${CONFIG_DIR}www_root
mkdir -p ${CONFIG_DIR}application_config
mkdir -p ${SITE_ROOT}

######################################################
# save config files
######################################################
cp -p ${SITE_ROOT}www_root/index.php ${CONFIG_DIR}www_root/index.php

cp -p ${SITE_ROOT}application/config/base.php ${CONFIG_DIR}application_config/base.php
cp -p ${SITE_ROOT}application/config/database.php ${CONFIG_DIR}application_config/database.php

for i in `echo $CONFIG_SAVE`
do
    cp -p ${SITE_ROOT}application/config/${i}.php ${CONFIG_DIR}application_config/${i}.php
done


######################################################
# replace files
######################################################
rm -R ${SITE_ROOT}/*
# get from svn
cd ${SITE_ROOT}
ls -l -a
svn export --force ${SVN_URL} ${SITE_ROOT}



######################################################
# copy back config files
######################################################
cp -p ${CONFIG_DIR}www_root/index.php ${SITE_ROOT}www_root/index.php

for i in `echo $CONFIG_SAVE`
do
    cp -p ${CONFIG_DIR}application_config/${i}.php ${SITE_ROOT}application/config/${i}.php
done

######################################################
# set permissions
######################################################
chown -R www-data:www-data ${SITE_ROOT}www_root/media/js
chown -R www-data:www-data ${SITE_ROOT}www_root/media/css
chown www-data:www-data ${SITE_ROOT}www_root/sitemap.xml

# Translation files, maybe another locatin would be nicer 
chown -R www-data:www-data ${SITE_ROOT}application/i18n

######################################################
# make sure directories are available
######################################################
mkdir -p /var/obp/${INSTANCE}/temp
mkdir -p /var/obp/${INSTANCE}/cache
mkdir -p /var/obp/${INSTANCE}/logs
mkdir -p /var/obp/${INSTANCE}/upload
mkdir -p /var/obp/${INSTANCE}/download
mkdir -p /var/obp/${INSTANCE}/static
chown -R www-data:www-data /var/obp/${INSTANCE}/temp
chown -R www-data:www-data /var/obp/${INSTANCE}/cache
chown -R www-data:www-data /var/obp/${INSTANCE}/logs
chown -R www-data:www-data /var/obp/${INSTANCE}/upload
chown -R www-data:www-data /var/obp/${INSTANCE}/download
chown -R www-data:www-data /var/obp/${INSTANCE}/static


######################################################
# finishing up
######################################################
# reload apache
/etc/init.d/apache2 reload

cd

wget --delete-after http://${HOST}/maintenance/installation
# sass ${SITE_ROOT}www_root/media/css/sass/master.sass ${SITE_ROOT}www_root/media/css/compiled/master.css
# sed -i "s/install_time_placeholder/$INSTALL_TIME/g" ${SITE_ROOT}application/config/version.php
# cp ${SITE_ROOT}www_root/media/css/compiled/master.css ${SITE_ROOT}www_root/media/css/compiled/${INSTALL_TIME}_master.css
