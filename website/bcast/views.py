from django.http import HttpResponse, HttpResponseBadRequest, Http404
import datetime

from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from django.conf import settings

from django.middleware.csrf import get_token


    
    
from django.views.generic import DetailView, ListView, FormView
from django.views.generic.detail import SingleObjectTemplateResponseMixin
from django.shortcuts import get_object_or_404, render_to_response

from django.template import loader



from filer.models.videomodels import Video

import json

from bcast.models import Event, Season, Channel

#from filer.models.filemodels import *
#from filer.models.foldermodels import *

from ajaxuploader.views import AjaxFileUploader

import os
import sys

def playlist(request, id):
    """A basic chat client window."""

    event = get_object_or_404(Event, id=id)
    
    folder = event.get_folder('recorded')
    
    videos = folder.files.instance_of(Video)
    videos.order_by('-name', '-original_filename')
    

    r = render_to_response('bcast/api/playlist.xml', {'event': event, 'folder': folder, 'videos': videos}, mimetype="application/xml",
                              context_instance=RequestContext(request))

    return r

def directory(request, id):
    """A basic chat client window."""

    event = get_object_or_404(Event, id=id)

    folder = event.get_folder('recorded')
    

    r = render_to_response('bcast/api/directory.html', {'event': event, 'folder': folder}, mimetype="text/html",
                              context_instance=RequestContext(request))
    
    return r

def encoder(request, id):
    """A basic chat client window."""
    event = get_object_or_404(Event, id=id)




    #s = django.template.loader.render_to_string(*args, **kwargs)
    s = loader.render_to_string('bcast/api/encoder.xml')
    s.encode("utf-16")
    
    response = HttpResponse(s, content_type='application/xml; charset=UTF-16', mimetype="application/xml; charset=UTF-16")
    response['Content-Disposition'] = 'attachment; filename=encoder.xml'

    return response

    

from ajaxuploader.backends.filer import FilerUploadBackend
ajax_uploader = AjaxFileUploader(FilerUploadBackend)
   
    
def upload(request, id):
    if request.method == "POST":
        if request.is_ajax():
            # the file is stored raw in the request
            upload = request
            is_raw = True
            # AJAX Upload will pass the filename in the querystring if it
            # is the "advanced" ajax upload
            try:
                filename = request.GET['qqfile']
            except KeyError:
                return HttpResponseBadRequest("AJAX request not valid")
        # not an ajax upload, so it was the "basic" iframe version with
        # submission via form
        else:
            is_raw = False
            if len(request.FILES) == 1:
                # FILES is a dictionary in Django but Ajax Upload gives
                # the uploaded file an ID based on a random number, so it
                # cannot be guessed here in the code. Rather than editing
                # Ajax Upload to pass the ID in the querystring, observe
                # that each upload is a separate request, so FILES should
                # only have one entry. Thus, we can just grab the first
                # (and only) value in the dict.
                upload = request.FILES.values()[0]
            else:
                raise Http404("Bad Upload")
            filename = upload.name
    
    
        print '*******************'
        print filename
        print '*******************'
    
        try:
            event = get_object_or_404(Event, id=id)
            folder = event.get_folder('uploads')
            
            
            
            
            
        except Exception, e:
            print e
    
    
        success = True
        extra_context = None
    
        # let Ajax Upload know whether we saved it or not
        ret_json = {'success': success, 'filename': filename}
        if extra_context is not None:
            ret_json.update(extra_context)
    
        return HttpResponse(json.dumps(ret_json))
    else:
        ret_json = {'success': False, 'filename': None}
        return HttpResponse(json.dumps(ret_json))
    
    
    
    
    
    
    
    





class EventDetailView(DetailView):

    context_object_name = "event"
    model = Event

    def get_context_data(self, **kwargs):

        event = self.get_object()
        
        current_season = Season.objects.filter(date_start__lte=datetime.datetime.now()).filter(date_end__gte=datetime.datetime.now())[0]

        context = super(EventDetailView, self).get_context_data(**kwargs)
        context['folder'] = event.folder
        context['folder_recordings'] = event.get_folder('recorded')
        context['folder_uploads'] = event.get_folder('uploads')
        
        
        context['current_season'] = current_season
        context['related_events'] = Event.objects.filter(Season=current_season).order_by('-date_start')
        
        return context
    