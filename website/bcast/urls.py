# -*- coding: utf-8 -*-

from django.conf.urls.defaults import *

import views

urlpatterns = patterns('',
    url(r"playlist/(?P<id>\d+)/$", views.playlist, name="bcast_playlist"),
    url(r"directory/(?P<id>\d+)/$", views.directory, name="bcast_directory"),
    
    # fileupload
    url(r'ajax-upload$', views.ajax_uploader, name="ajax_uploader"),
    
    #url(r"upload/(?P<id>\d+)/$", views.upload, name="bcast_upload"),
)



