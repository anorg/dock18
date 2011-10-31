# -*- coding: utf-8 -*-
import os

import posixpath
import pinax

gettext = lambda s: s

PROJECT_DIR = os.path.abspath(os.path.dirname(__file__))

DEBUG = True



TEMPLATE_DEBUG = DEBUG
COMPRESS_ENABLED = False

# pinax constants
PINAX_ROOT = os.path.abspath(os.path.dirname(pinax.__file__))
PINAX_THEME = 'default'

SERVE_MEDIA = True

ADMINS = (
    ('anorg', 'network@anorg.net'),
)
MANAGERS = ADMINS

LANGUAGES = [('en', 'en')]
DEFAULT_LANGUAGE = 0

DATABASES = {

    'default': {
        'ENGINE': 'django.db.backends.mysql',
        #'NAME': 'dock18_ch-dev',
        'NAME': 'fresh',
        'USERNAME': 'root',
        'PASSWORD': 'root',
    },
    'sqlite': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(PROJECT_DIR, 'dev.db'),
    }
}

TIME_ZONE = 'Europe/Zurich'

LANGUAGE_CODE = 'en-us'
#LANGUAGE_CODE = 'de-de'

SITE_ID = 1

USE_I18N = True
USE_L10N = True




SECRET_KEY = '0r6%7gip5tmez*vygfv+u14h@4lbt^8e2^26o#5_f_#b7%cm)u'


TEMPLATE_LOADERS = (
    # 'django.template.loaders.filesystem.load_template_source',
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
    'django.template.loaders.eggs.Loader',
)

MIDDLEWARE_CLASSES = (
#    'django.middleware.cache.UpdateCacheMiddleware', #
                      
    'django.middleware.common.CommonMiddleware',
    
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django_openid.consumer.SessionConsumer',
    'django.contrib.messages.middleware.MessageMiddleware',
    # pinax
    'pinax.apps.account.middleware.LocaleMiddleware',
    'pagination.middleware.PaginationMiddleware',
    'pinax.middleware.security.HideSensistiveFieldsMiddleware',
    'debug_toolbar.middleware.DebugToolbarMiddleware',
    # cms
    #'cms.middleware.multilingual.MultilingualURLMiddleware',
    'cms.middleware.page.CurrentPageMiddleware',
    'cms.middleware.user.CurrentUserMiddleware',
    'cms.middleware.toolbar.ToolbarMiddleware',
    #'cms.middleware.media.PlaceholderMediaMiddleware',
    #'cms_redirects.middleware.RedirectFallbackMiddleware',
    # lib
    #'lib.prettify.PrettifyMiddleware', 
    
#    'django.middleware.cache.FetchFromCacheMiddleware', #
    'cms.middleware.toolbar.ToolbarMiddleware',
)

# CACHE_BACKEND = 'memcached://127.0.0.1:11211/'
CACHE_BACKEND = 'locmem:///'

TEMPLATE_CONTEXT_PROCESSORS = (
    'django.contrib.auth.context_processors.auth',
    'django.core.context_processors.debug',
    'django.core.context_processors.i18n',
    'django.core.context_processors.request',
    'django.core.context_processors.media',
    'django.contrib.messages.context_processors.messages',
    # pinax
    'pinax.core.context_processors.pinax_settings',
    'pinax.apps.account.context_processors.account',
    'notification.context_processors.notification',
    'announcements.context_processors.site_wide_announcements',
    # cms
    'cms.context_processors.media',
    # staticfiles
    'django.core.context_processors.static',
    'sekizai.context_processors.sekizai',
)

CMS_TEMPLATES = (
    #('example.html', 'Example Template'),
    #('base.html', 'Base Template'),
    ('layout/1col.html', 'Base - One column & Menu'),
    ('layout/2col.html', 'Base - One column & FlexBox'),
    #('layout/3col.html', '3 column inner'),

)


CMS_PLACEHOLDER_CONF = {
    'template_1_content_a': {
        #"plugins": ('TeaserPlugin', 'LinkPlugin'),
        "extra_context": {"width":600},
        'name':gettext("Main Content"),
    },
    'template_1_content_2': {
        #"plugins": ('TeaserPlugin', 'LinkPlugin'),
        "extra_context": {"width":300},
        'name':gettext("FlexBox"),
    },
    'sidebar_pre': {
        #"plugins": ('TeaserPlugin', 'LinkPlugin'),
        "extra_context": {"width":280},
        'name':gettext("Sidebar | Pre-Menu"),
    },
    'sidebar_post': {
        #"plugins": ('TeaserPlugin', 'LinkPlugin'),
        "extra_context": {"width":280},
        'name':gettext("Sidebar | Post-Menu"),
    },
}





TEMPLATE_DIRS = (
    os.path.join(PROJECT_DIR, 'templates'),
    os.path.join(PINAX_ROOT, 'themes', PINAX_THEME, 'templates'),
)

CMS_PLUGIN_PROCESSORS = (
    'bcast.cms_plugin_processors.wrap_text',
)

CMS_SEO_FIELDS = True



CMS_CACHE_DURATIONS = {
    'menus': 1,
    'content': 1,
}


CMS_FLAT_URLS = True



ROOT_URLCONF = 'urls'





DAJAXICE_MEDIA_PREFIX = 'dajaxice'

# media deliver
MEDIA_ROOT = os.path.join(PROJECT_DIR, 'media')
MEDIA_URL = '/media/'

# static files (application js/img etc)
STATIC_ROOT = os.path.join(PROJECT_DIR, 'static')
STATIC_URL = '/static/'


FILER_STATICMEDIA_PREFIX = '/static/filer/'


ADMIN_MEDIA_PREFIX = posixpath.join(STATIC_URL, "admin/")
ADMIN_MEDIA_PREFIX = '/static/admin/'




STATICFILES_DIRS = (
    os.path.join(PROJECT_DIR, 'media'),
)


STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    # other finders..
    'compressor.finders.CompressorFinder',
)



INSTALLED_APPS = (
            
    # filebrowser
    #'filebrowser',
    #'grappelli',

    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.humanize',

    'django.contrib.admin',
    'django.contrib.comments',
    'django.contrib.staticfiles',
    
    # pinax required/related
    'pinax.templatetags',
    'notification',
    'compressor',
    'debug_toolbar',
    'mailer',
    'uni_form',
    'django_openid',
    'timezones',
    'emailconfirmation',
    'announcements',
    'pagination',
    'idios',
    'phileo',
    
    # spectacors aka participants, guests, etc
    'spectators',
    
    'analytics',
    'streamstat',
    
    # auth addon
    'facebook',
    
    # pinax apps (pinax.)
    'pinax.apps.account',
    'pinax.apps.signup_codes',
    'pinax.apps.analytics',
    'kaleo',
    
    # pinax apps (project.)
    'about',
    'profiles',
    
    
    # cms base
    'south',
    'cms',
    'menus',
    'mptt',
    #'appmedia',
    #'filer',
    
    'filer',
    
    
#    # cms plugins (default)
    'cms.plugins.text',
    'cms.plugins.picture',
    'cms.plugins.link',
    'cms.plugins.file',
    'cms.plugins.snippet',
    'cms.plugins.googlemap',
    'sekizai',
    
    'cmsplugin_filer_file',
    'cmsplugin_filer_folder',
    'cmsplugin_filer_image',
    'cmsplugin_filer_teaser',
    'cmsplugin_filer_video',
    
    # asset and media handling
    'compressor',
    'easy_thumbnails',
    #'cms_redirects',
    
    # ajax
    'dajaxice',
    
    # project apps
    
    'ajax',
    'taggit',
    'jqchat', 
    
    'bcast',
    
    'lib',
    
)


FILER_IS_PUBLIC_DEFAULT = True
"""
THUMBNAIL_PROCESSORS = (
    'easy_thumbnails.processors.colorspace',
    'easy_thumbnails.processors.autocrop',
    #'easy_thumbnails.processors.scale_and_crop',
    'filer.thumbnail_processors.scale_and_crop_with_subject_location',
    'easy_thumbnails.processors.filters',
)
"""
THUMBNAIL_PROCESSORS = (
    'easy_thumbnails.processors.colorspace',
    'easy_thumbnails.processors.autocrop',
    #'easy_thumbnails.processors.scale_and_crop',
    'filer.thumbnail_processors.scale_and_crop_with_subject_location',
    'easy_thumbnails.processors.filters',
)


FILEBROWSER_DIRECTORY = 'fb'

FIXTURE_DIRS = [
    os.path.join(PROJECT_DIR, 'fixtures'),
]


GOOGLE_MAPS_API_KEY = 'ABQIAAAAOHPJc2-0TzaYgfOquRJgtRR2_LvdznTgfqpGEUf18uq-dm_lmhSjdzKrt5n5UfFjwviK9F39LyXJng'


MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'
EMAIL_BACKEND = 'mailer.backend.DbBackend'

ABSOLUTE_URL_OVERRIDES = {
    'auth.user': lambda o: '/profiles/profile/%s/' % o.username,
}

AUTH_PROFILE_MODULE = 'profiles.Profile'
NOTIFICATION_LANGUAGE_MODULE = 'account.Account'
ACCOUNT_OPEN_SIGNUP = True
ACCOUNT_REQUIRED_EMAIL = False
ACCOUNT_EMAIL_VERIFICATION = False
ACCOUNT_EMAIL_AUTHENTICATION = False
ACCOUNT_UNIQUE_EMAIL = EMAIL_CONFIRMATION_UNIQUE_EMAIL = False

AUTHENTICATION_BACKENDS = [
    'facebook.backend.FacebookBackend',
    'django.contrib.auth.backends.ModelBackend',
    'pinax.apps.account.auth_backends.AuthenticationBackend',
]

LOGIN_URL = '/account/login/' # @@@ any way this can be a url name?
#LOGIN_REDIRECT_URLNAME = "what_next"
LOGIN_REDIRECT_URL = "/"

EMAIL_CONFIRMATION_DAYS = 5
EMAIL_DEBUG = DEBUG

THUMBNAIL_QUALITY = 80

DEBUG_TOOLBAR_CONFIG = {
    'INTERCEPT_REDIRECTS': False,
}

CONTACT_EMAIL = 'root@dock18.ch'



# facebook oauth settings
FACEBOOK_APP_ID = "173374022743087"
FACEBOOK_APP_SECRET = "423e6cee277a1536df4f3ee7195fdfbc"
FACEBOOK_SCOPE = 'email,publish_stream'


JQCHAT_DATE_FORMAT={
    "date_groups": "F Y",
    "not_this_year": "jS F Y",
    "not_this_month": "jS F",    
    "this_month": "jS",  
    "test": "F Y hh:mm:ss",
}


# hm - how to handle multiple...
# AUTH_PROFILE_MODULE = 'facebook.FacebookProfile'



# try to override from local_config.py
try:
    from local_settings import *
except ImportError:
    pass

#import logging
#logging.basicConfig(level=logging.DEBUG)
