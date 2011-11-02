import django.dispatch


invite_sent = django.dispatch.Signal(providing_args=["subscription",])
invite_accepted = django.dispatch.Signal(providing_args=["subscription"])
