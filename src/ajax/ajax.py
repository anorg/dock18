from django.utils import simplejson
from dajaxice.core import dajaxice_functions
from dajaxice.decorators import dajaxice_register

import random
import urllib
import urllib2
import json

import datetime


def loopcount(request):
    
    api_url = "http://2011.poollooq.ch/ajax/loopcount"
    api_key = "xyz"
    
    try:
        data = urllib.urlencode({'apikey': api_key})
        response = urllib.urlopen(api_url, data)
        message = response.read()
        
    except Exception, e:
        message = "?????"
    
    print message
    
    return simplejson.dumps({'message':message})

dajaxice_functions.register(loopcount)


#@dajaxice_register
def chat(request):
    
    return simplejson.dumps({'message':'hans: lalasadjhakjdsh'})

dajaxice_functions.register(chat)


def error_example(request):
    raise Exception("Some Exception")
    
dajaxice_functions.register(error_example)