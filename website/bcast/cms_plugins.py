from django.db import models
from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from cms.models.pluginmodel import CMSPlugin

from filer.models.filemodels import *
from filer.models.foldermodels import *

from django.utils.translation import ugettext as _

from django.db.models import Q

from datetime import datetime

# app specific imports
from bcast.models import EventPlugin as EventPluginModel
from bcast.models import EventListPlugin as EventListPluginModel
from bcast.models import ParticipantsPlugin as ParticipantsPluginModel
from bcast.models import Event
from bcast.forms import *

"""
EventPlugin - Handles complete events
"""
@plugin_pool.register_plugin
class EventPlugin(CMSPluginBase):
    model = EventPluginModel
    name = _("Event Plugin")
    render_template = "bcast/plugins/event_detail.html"

    def render(self, context, instance, placeholder):
        
        
        participants = instance.event.participants.all()
        participants.form = ParticipateForm
        
        folder = instance.event.folder
        # folder_recordings, created = Folder.objects.get_or_create(name='recorded', parent=folder)
        folder_recordings = instance.event.get_folder('recorded')
        folder_uploads = instance.event.get_folder('uploads')
   
        print "event folder:"
        print folder
   
        context.update({
            'event':instance.event,
            'participants':participants,
            'folder':folder,
            'folder_recordings':folder_recordings,
            'folder_uploads':folder_uploads,
            'object':instance,
            'placeholder':placeholder
        })
        return context



"""
EventListing - List of Events (e.g. to use on front-page)
"""
@plugin_pool.register_plugin
class EventListingPlugin(CMSPluginBase):
    
    model = EventListPluginModel
    name = _("Event List")
    render_template = "bcast/event_list.html"

    def render(self, context, instance, placeholder):

        
        kwargs = {}
        
        if instance.channel is not None:
            kwargs[ 'channel' ] = instance.channel
            
        if instance.season is not None:
            kwargs[ 'Season' ] = instance.season
        

        objects = {}
        
        if instance.range == 'past':
            objects = Event.published.filter(date_start__lte=datetime.now()).filter(date_end__lte=datetime.now()).filter( **kwargs ).filter( **kwargs )
            
        if instance.range == 'future': 
            objects = Event.objects.filter(Q(date_start__gte=datetime.now()) | Q(date_end__gte=datetime.now())).filter( **kwargs )
        
        if instance.range == 'all':
            objects = Event.published.filter( **kwargs )
            
            
        if instance.ordering == 'asc':
            objects = objects.order_by('-date_end')
            
        if instance.ordering == 'desc':
            objects = objects.order_by('date_end')
            
            
        if instance.limit:
            objects = objects[:instance.limit]

        
        context.update({
            'instance': instance,
            'objects': objects,
            'placeholder': placeholder,
        })
        
        return context



"""
Participants - List of Participants for Event
"""
@plugin_pool.register_plugin
class ParticipantsPlugin(CMSPluginBase):
    
    model = ParticipantsPluginModel
    name = _("Participants")
    render_template = "bcast/participant_list.html"

    def render(self, context, instance, placeholder):

        latest = Event.published.all()[:instance.limit]
        
        context.update({
            'instance': instance,
            'latest': latest,
            'placeholder': placeholder,
        })
        
        return context
