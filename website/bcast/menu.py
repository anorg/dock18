from menus.base import Menu, NavigationNode
from menus.menu_pool import menu_pool
from django.utils.encoding import smart_str

from bcast.models import Event

@menu_pool.register_menu
class EventMenu(Menu):
    

    def get_nodes(self, request):
        
        events = Event.objects.all()
        nodes = []

        for event in events:
            
            title = smart_str(event.date_start) + ' | ' + smart_str(event.title)
            #nodes.append(NavigationNode(title, event.get_absolute_url(), 'events', attr={'reverse_id':'events'}))

        return nodes

