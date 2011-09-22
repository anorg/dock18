from menus.base import Menu, NavigationNode
from menus.menu_pool import menu_pool
from django.utils.translation import ugettext_lazy as _

from bcast.models import Event

@menu_pool.register_menu
class EventMenu(Menu):
    
    name = 'event'
    id = 'event'

    def get_nodes(self, request):
        
        events = Event.objects.all()
        nodes = []

        for event in events:
            
            # format the title
            title = str(event.date_start) + ' | ' + str(event.title)
            #nodes.append(NavigationNode(title, event.get_absolute_url(), 'events', attr={'reverse_id':'events'}))

        return nodes

