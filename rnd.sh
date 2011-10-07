#!/bin/sh
RANDOM=`date '+%s'`
echo $[($RANDOM % 6) + 1]
