from django.conf.urls.defaults import url, patterns



urlpatterns = patterns("spectators.views",
    url(r"^spectate/(?P<content_type_id>\d+):(?P<object_id>\d+)/$", "spectate_toggle", name="spectators_spectate_toggle")
)
