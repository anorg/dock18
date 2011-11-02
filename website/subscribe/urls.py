from subscribe.views import invite

from django.conf.urls.defaults import *
from django.contrib import admin
from django.views.generic.simple import direct_to_template
from django.conf import settings

admin.autodiscover()



urlpatterns = patterns('subscribe.views',
                       
    url (r'^admin/subscribe/subscription/download/csv/$', 
        view='generate_csv',
        name='download_csv',
    ),
                       
    url(r"^subscribe/$", invite, name="subscription_subscribe"),
)
