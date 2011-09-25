from django.http import HttpResponseBadRequest

from django.http import HttpResponse

from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from django.conf import settings

from bcast.models import Event

def playlist(request, id):
    """A basic chat client window."""

    ThisEvent = get_object_or_404(Event, id=id)
    
    ThisEvent.playlist = []
    
    track = {"key":"xyz", "path":"/path/to/"}
    
    ThisEvent.playlist.append(track)
    

    r = render_to_response('bcast/api/playlist.xml', {'event': ThisEvent}, mimetype="application/xml",
                              context_instance=RequestContext(request))
    
    r.mimetype = 'application/xml'
    return r