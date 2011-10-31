from django.utils import simplejson
from dajaxice.core import dajaxice_functions
from dajaxice.decorators import dajaxice_register
from django.core.cache import cache

from bcast.models import *

import random
import urllib
import urllib2
import json

import datetime

from xml.etree import ElementTree as ET


def loopcount(request):
    
    api_url = "http://rtmp.dock18.ch:8086/connectioncounts"
    api_key = "xyz"
    
    
    data_json = cache.get('data_json')
    
    if not data_json:

        try:
            data = urllib.urlencode({'apikey': api_key})
            response = urllib.urlopen(api_url, data)
            message = response.read()
            
            element = ET.XML(message)
            
        except Exception, e:
            element = None
            message = "?????"
            
        try:
            if element:
                print element
                print '*', 
                print element[0].text,
                print element[1].text,
                print element[4].text,
                print element[5].text,
                print '*'
                
                total = element[1].text
                current = element[0].text
                bw = str(float(element[5].text) / 1000000) + 'MBps'
            
        except Exception, e:
            total = 'error'
            current = 'error'
            bw = 'error'
            
        target = '#streamcounter'
        
        message = '<p><span><span>Total: </span>%s</span><span> / <span>Jetzt: </span>%s</span><br />' % (total, current);
        message += '<span><span>BW: </span>%s</span></p><p>&nbsp;</p>' % (bw);
    
        data_json = {'target' :target,'content' :message}
        cache.set('data_json', data_json, 30)
    
    return simplejson.dumps(data_json)

dajaxice_functions.register(loopcount)


#@dajaxice_register
def chat(request):
    
    return simplejson.dumps({'message':'hans: lalasadjhakjdsh'})

dajaxice_functions.register(chat)


def error_example(request):
    raise Exception("Some Exception")
    
dajaxice_functions.register(error_example)


def participate(request, data):
    
    print data['id']
    print data['name']
    
    return simplejson.dumps({'user':'xxyyzz'})

dajaxice_functions.register(participate)