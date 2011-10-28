from django.db import models
from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from cms.models.pluginmodel import CMSPlugin

from django.utils.translation import ugettext as _

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
    render_template = "bcast/event_detail.html"

    def render(self, context, instance, placeholder):
        
        
        participants = instance.event.participants.all()
        participants.form = ParticipateForm
        

        
        folder = instance.event.folder
   
        context.update({
            'event':instance.event,
            'participants':participants,
            'folder':folder,
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

        latest = Event.published.all()[:instance.limit]
        
        context.update({
            'instance': instance,
            'latest': latest,
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
