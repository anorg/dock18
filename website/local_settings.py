DATABASES = {

    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'fresh', 
        'USERNAME': 'root',
        'PASSWORD': 'root',
    },
}

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
