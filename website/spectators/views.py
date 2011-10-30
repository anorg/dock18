from django.contrib.auth.decorators import login_required
from django.contrib.contenttypes.models import ContentType

from django.http import HttpResponse
from django.utils import simplejson as json
from django.shortcuts import get_object_or_404, redirect
from django.views.decorators.http import require_POST

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
    else:
        spectate.delete()
        object_unspectated.send(
            sender=Spectate,
            object=content_type.get_object_for_this_type(
                pk=object_id
            )
        )
    
    if request.is_ajax():
        return HttpResponse(json.dumps({
            "spectates_count": Spectate.objects.filter(
                sender = request.user,
                receiver_content_type = content_type,
                receiver_object_id = object_id
            ).count()
        }), mimetype="application/json")
    
    return redirect(request.META["HTTP_REFERER"])
