# -*- coding: utf-8 -*-

from django.conf.urls.defaults import *

import views

urlpatterns = patterns('',
    url(r"playlist/(?P<id>\d+)/$", views.playlist, name="bcast_playlist"),
)



