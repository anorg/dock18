#!/bin/sh
#ffmpeg -i testfile.avi -re -acodec libfaac -ar 22050 -vcodec libx264 -vpre default -f flv rtmp://localhost/live/testStream
ffmpeg -i ~/Downloads/__nzb/__done/Page\ Eight\ \(2011\)/page.eight.2011.dvdrip.xvid-archivist/page.eight.2011.dvdrip.xvid-archivist.avi -re -acodec libfaac -ar 22050 -vcodec libx264 -vpre d18livea -f flv rtmp://192.168.200.128:1935/d18live/2011-11-10_testevent-now
