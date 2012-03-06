from django.conf.urls.defaults import *
from django.views.generic import ListView

from django.views.generic.simple import direct_to_template

from bcast.views import EventDetailView

import views

# app imports
#from bcast.models import Artist, Release, Media, Label
#from bcast.views import *



urlpatterns = patterns('',
    url(r"playlist/(?P<id>\d+)/$", views.playlist, name="bcast_playlist"),
    url(r"directory/(?P<id>\d+)/$", views.directory, name="bcast_directory"),
    
    # fileupload
    url(r'ajax-upload$', views.ajax_uploader, name="ajax_uploader"),
    
    #url(r"upload/(?P<id>\d+)/$", views.upload, name="bcast_upload"),

    # events                   
    (r'^event/(?P<slug>[-\w]+)/$', EventDetailView.as_view()),

    
    
)

