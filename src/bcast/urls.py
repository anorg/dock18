# -*- coding: utf-8 -*-

from django.conf.urls.defaults import *

import views

urlpatterns = patterns('',
    url(r"playlist/(?P<id>\d+)/$", views.playlist, name="bcast_playlist"),
    url(r"directory/(?P<id>\d+)/$", views.directory, name="bcast_directory"),
)



