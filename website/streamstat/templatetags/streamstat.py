from django import template
from django.db import models
from django.contrib.sites.models import Site

from django.template import Context, loader

import urllib
from xml.dom import minidom

register = template.Library()

@register.tag
def get_streamstat(parser, token):
    
    print token

    try:
        # split_contents() knows not to split quoted strings.
        tag_name, stream_server = token.split_contents()
    except ValueError:
        stream_server = None

    print stream_server

    return StreamstatsNode(stream_server)
    
class StreamstatsNode(template.Node):
    def __init__(self, server=None):
        self.server = server
        
    def render(self, context):
        
        """
        call stream stats on rtmp server
        """        

        t = loader.get_template('streamstat/inline.html')
        c = Context({
            'server': self.server,
        })
        return t.render(c)



register.tag('streamstat', get_streamstat)