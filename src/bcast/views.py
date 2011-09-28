from django.http import HttpResponseBadRequest

from django.http import HttpResponse

from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from django.conf import settings

from bcast.models import Event

from filer.models.filemodels import *
from filer.models.foldermodels import *

import os
import sys

def playlist(request, id):
    """A basic chat client window."""

    event = get_object_or_404(Event, id=id)
    
    folder = event.get_folder('recorded')
    

    r = render_to_response('bcast/api/playlist.xml', {'event': event, 'folder': folder}, mimetype="application/xml",
                              context_instance=RequestContext(request))

    return r

def directory(request, id):
    """A basic chat client window."""

    event = get_object_or_404(Event, id=id)

    folder = event.get_folder('recorded')
    

    r = render_to_response('bcast/api/directory.html', {'event': event, 'folder': folder}, mimetype="text/html",
                              context_instance=RequestContext(request))
    
    return r