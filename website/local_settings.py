import os


PROJECT_DIR = os.path.abspath(os.path.dirname(__file__))

DATABASES = {
      'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(PROJECT_DIR, 'dev.db'),
    },
}

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
