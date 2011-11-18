import django.dispatch

object_spectated = django.dispatch.Signal(providing_args=["spectate"])
object_unspectated = django.dispatch.Signal(providing_args=["object"])
