import os
import sys
sys.stdout = sys.stderr
# Add the virtual Python environment site-packages directory to the path
import site
site.addsitedir('/srv/2011-02_dock18/lib/python2.6/site-packages')


# Avoid [Errno 13] Permission denied: '/var/www/.python-eggs' messages
import os
os.environ['PYTHON_EGG_CACHE'] = '/var/www/django/2011-02_dock18_ch/mod_wsgi/egg-cache'

#If your project is not on your PYTHONPATH by default you can add the following
sys.path.append('/var/www/django/2011-02_dock18_ch/src')
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'


import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()