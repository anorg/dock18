from django.conf.urls.defaults import *
from django.conf import settings
from django.views.generic.simple import direct_to_template

# pinax
from pinax.apps.account.openid_consumer import PinaxConsumer
handler500 = "pinax.views.server_error"

from django.contrib import admin
admin.autodiscover()

from dajaxice.core import dajaxice_autodiscover
dajaxice_autodiscover()

from flashpolicies import views


urlpatterns = patterns('',
    # dajaxice
    (r'^%s/' % settings.DAJAXICE_MEDIA_PREFIX, include('dajaxice.urls')),
    
    
    (r'^crossdomain.xml/$',
        'flashpolicies.views.simple',
        {'domains': ['ulysses.dock18.ch']}),
    
    
    # facebook connect
    url(r'^facebook/login$', 'facebook.views.login'),
    url(r'^facebook/authentication_callback$', 'facebook.views.authentication_callback'),
                       
    # pinax 
    url(r"^admin/invite_user/$", "pinax.apps.signup_codes.views.admin_invite_user", name="admin_invite_user"),
    url(r"^admin/", include(admin.site.urls)),
    url(r"^about/", include("about.urls")),
    url(r"^account/", include("pinax.apps.account.urls")),
    url(r"^openid/", include(PinaxConsumer().urls)),
    url(r"^profiles/", include("idios.urls")),
    url(r"^notices/", include("notification.urls")),
    url(r"^announcements/", include("announcements.urls")),
    
    url(r"^invites/", include("kaleo.urls")),


    (r'^bcast/', include('bcast.urls')),
    
    
    # only devel
    url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {
        'document_root': settings.MEDIA_ROOT,
    }),

    # admin             
    # (r'^admin/', include(admin.site.urls)),
    
    # filer
    # url(r'^', include('filer.server.urls')),
    
    #(r'^grappelli/', include('grappelli.urls')),
    
    #(r'^admin/filebrowser/', include('filebrowser.urls')),
    
    #(r'^adminfiles/', include('adminfiles.urls')),
    
    
    url(r"^likes/", include("phileo.urls")),
    url(r"^spectate/", include("spectators.urls")),
    
    # apps
    (r'^jqchat/', include('jqchat.urls')),
    
    # plugins
    (r'^comments/', include('django.contrib.comments.urls')),
    
    # cms base
    (r'^', include('cms.urls')),
    
    
)


if settings.SERVE_MEDIA:
    urlpatterns += patterns("",
        url(r"", include("staticfiles.urls")),
    )

if settings.DEBUG:
    urlpatterns = patterns('',
        #(r'^' + settings.MEDIA_URL.lstrip('/'), include('appmedia.urls')),
    ) + urlpatterns
    
if 1 == 1:
    urlpatterns += patterns('',
        url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {
            'document_root': settings.MEDIA_ROOT,
        }),
   )