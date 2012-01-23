import os


PROJECT_DIR = os.path.abspath(os.path.dirname(__file__))

DATABASES = {
      'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        # 'NAME': os.path.join(PROJECT_DIR, 'dev.db'),
        'NAME': '/Users/ohrstrom/srv/dock18_ch/data.db',
    },
}

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
