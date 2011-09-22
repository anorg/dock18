# -*- coding: utf-8 -*-
import os

import posixpath
import pinax

gettext = lambda s: s

PROJECT_DIR = os.path.abspath(os.path.dirname(__file__))

# pinax
PINAX_ROOT = os.path.abspath(os.path.dirname(pinax.__file__))
PROJECT_ROOT = os.path.abspath(os.path.dirname(__file__))

PINAX_THEME = 'default'

DEBUG = True
TEMPLATE_DEBUG = DEBUG

SERVE_MEDIA = DEBUG

# COMPRESS_ENABLED = True # default = opposite of DEBUG

ADMINS = (
    ('anorg', 'network@anorg.net'),
)

MANAGERS = ADMINS

LANGUAGES = [('en', 'en'), ('de', 'de')]
#LANGUAGES = [('de', 'de')]
DEFAULT_LANGUAGE = 0

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'dock18-dev',
        'USERNAME': 'root',
        'PASSWORD': 'root',
    },
    'sqlite': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(PROJECT_DIR, 'mycms.db'),
    }
}

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# On Unix systems, a value of None will cause Django to use the same
# timezone as the operating system.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = 'Europe/Zurich'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'en-us'
#LANGUAGE_CODE = 'de-de'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

# If you set this to False, Django will not format dates, numbers and
# calendars according to the current locale
USE_L10N = True

# URL prefix for admin media -- CSS, JavaScript and images. Make sure to use a
# trailing slash.
# Examples: 'http://foo.com/media/', '/media/'.
ADMIN_MEDIA_PREFIX = '/media/admin/'

# Make this unique, and don't share it with anybody.
SECRET_KEY = '0r6%7gip5tmez*vygfv+u14h@4lbt^8e2^26o#5_f_#b7%cm)u'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.load_template_source',
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
    'django.template.loaders.eggs.Loader',
)

MIDDLEWARE_CLASSES = (
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
    'cms.middleware.multilingual.MultilingualURLMiddleware',
    'cms.middleware.page.CurrentPageMiddleware',
    'cms.middleware.user.CurrentUserMiddleware',
    'cms.middleware.toolbar.ToolbarMiddleware',
    'cms.middleware.media.PlaceholderMediaMiddleware',
    'cms_redirects.middleware.RedirectFallbackMiddleware',
    'lib.prettify.PrettifyMiddleware',
)

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
    'django.core.context_processors.static'
)

CMS_TEMPLATES = (
    ('example.html', 'Example Template'),
    #
    ('base.html', 'Base Template'),
    ('simple.html', 'Simple Template'),
    ('layout/1col.html', '1 column inner'),
    ('layout/3col.html', '3 column inner'),

)

CMS_PLUGIN_PROCESSORS = (
    #'bcast.cms_plugin_processors.wrap_in_colored_box',
)

ROOT_URLCONF = 'urls'

MEDIA_ROOT = os.path.join(PROJECT_DIR, 'media')
MEDIA_URL = '/media/'

STATIC_ROOT = os.path.join(PROJECT_DIR, 'static')
STATIC_URL = '/static/'


STATICFILES_DIRS = (
    os.path.join(PROJECT_DIR, 'media'),
    #os.path.join(PROJECT_DIR, 'static'),
    #os.path.join(PINAX_ROOT, 'themes', PINAX_THEME, 'static'),
)

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    # other finders..
    'compressor.finders.CompressorFinder',
)



DAJAXICE_MEDIA_PREFIX = 'dajaxice'

TEMPLATE_DIRS = (
    os.path.join(PROJECT_DIR, 'templates'),
    os.path.join(PINAX_ROOT, 'themes', PINAX_THEME, 'templates'),
)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.humanize',
    'django.contrib.admin',
    'django.contrib.comments',
    'django.contrib.staticfiles',
    
    
    'pinax.templatetags',
    
    # base apps
    

    'notification', # must be first
    #'staticfiles',
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
    
    # cms base
    'cms',
    'menus',
    'mptt',
    'appmedia',
    'south',
    
    # Pinax
    'pinax.apps.account',
    'pinax.apps.signup_codes',
    'pinax.apps.analytics',
    
    
    
    # pinax project
    'about',
    'profiles',
    
    # cms plugins (default)
    'cms.plugins.text',
    'cms.plugins.picture',
    'cms.plugins.link',
    'cms.plugins.file',
    'cms.plugins.snippet',
    'cms.plugins.googlemap',
    
    # asset shizzle
    'compressor',
    'easy_thumbnails',
    'cms_redirects',
    
    # auth
    #'oauth_access',
    
    # other
    'dajaxice',
    
    # custom
    #'polls',
    'bcast',
    'ajax',
    

    
    #
    #'jchat',
    #
    'taggit',
    'jqchat',
    
)

FIXTURE_DIRS = [
    os.path.join(PROJECT_ROOT, 'fixtures'),
]

GOOGLE_MAPS_API_KEY = 'ABQIAAAAOHPJc2-0TzaYgfOquRJgtRR2_LvdznTgfqpGEUf18uq-dm_lmhSjdzKrt5n5UfFjwviK9F39LyXJng',

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
    'pinax.apps.account.auth_backends.AuthenticationBackend',
]

LOGIN_URL = '/account/login/' # @@@ any way this can be a url name?
LOGIN_REDIRECT_URLNAME = '/'

EMAIL_CONFIRMATION_DAYS = 2
EMAIL_DEBUG = DEBUG

THUMBNAIL_QUALITY = 80

DEBUG_TOOLBAR_CONFIG = {
    'INTERCEPT_REDIRECTS': False,
}

try:
    from local_settings import *
except ImportError:
    pass

import logging
#logging.basicConfig(level=logging.DEBUG)