from django.contrib.auth.decorators import login_required
from django.contrib.contenttypes.models import ContentType

from django.http import HttpResponse
from django.utils import simplejson as json
from django.shortcuts import get_object_or_404, redirect
from django.views.decorators.http import require_POST

# hack in notifications / oservations
from notification import models as notification

from spectators.models import Spectate
from spectators.signals import object_spectated, object_unspectated


@require_POST
@login_required
def spectate_toggle(request, content_type_id, object_id):
    content_type = get_object_or_404(ContentType, pk=content_type_id)
    
    spectate, created = Spectate.objects.get_or_create(
        sender = request.user,
        receiver_content_type = content_type,
        receiver_object_id = object_id
    )
    
    if created:
        object_spectated.send(sender=Spectate, spectate=spectate)
        
        object=content_type.get_object_for_this_type(pk=object_id)
        notification.observe(object, request.user, 'event_processed', signal='observe_processed')
        
    else:
        spectate.delete()
        
        object=content_type.get_object_for_this_type(pk=object_id)
        
        object_unspectated.send(
            sender=Spectate,
            object=object
        )
        
        notification.stop_observing(object, request.user, signal='observe_processed')
    
    if request.is_ajax():
        
        spectators = []
        ts = Spectate.objects.filter(
                receiver_content_type = content_type,
                receiver_object_id = object_id
            )

        for s in ts:
            try:
                spectators.append(str(s.sender.get_profile.nameee))
            except Exception, e:
                spectators.append(str(s.sender))

        
        return HttpResponse(json.dumps({
            "spectates_count": Spectate.objects.filter(
                sender = request.user,
                receiver_content_type = content_type,
                receiver_object_id = object_id
            ).count(),
            "spectators": spectators
        }), mimetype="application/json")
    
    return redirect(request.META["HTTP_REFERER"])
