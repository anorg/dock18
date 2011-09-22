from django.db import models
from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from cms.models.pluginmodel import CMSPlugin

from django.utils.translation import ugettext as _

# app specific imports
from bcast.models import EventPlugin as EventPluginModel
from bcast.models import EventListPlugin as EventListPluginModel
from bcast.models import Event

"""
EventPlugin - Handles complete events
"""
class EventPlugin(CMSPluginBase):
    model = EventPluginModel # Model where data about this plugin is saved
    name = _("Event Plugin") # Name of the plugin
    render_template = "bcast/event_detail.html" # template to render the plugin with

    def render(self, context, instance, placeholder):
        #context.update({'instance':instance})        
        context.update({
            'event':instance.event,
            'object':instance,
            'placeholder':placeholder
        })
        return context

plugin_pool.register_plugin(EventPlugin) # register the plugin





"""
EventListing - List of Events (e.g. to use on front-page)
"""
class EventListingPlugin(CMSPluginBase):
    
    model = EventListPluginModel
    name = _("Event List")
    render_template = "bcast/event_list.html"

    def render(self, context, instance, placeholder):
        """
            Render the latest news
        """
        latest = Event.published.all()[:instance.limit]
        
        context.update({
            'instance': instance,
            'latest': latest,
            'placeholder': placeholder,
        })
        
        return context

    
    """
    def render(self, context, instance, placeholder):
        
        context.update({
                        'context':context,
                        'instance':instance,
                        'placeholder':placeholder,
                        })        
                
        return context
    """
plugin_pool.register_plugin(EventListingPlugin) # register the plugin