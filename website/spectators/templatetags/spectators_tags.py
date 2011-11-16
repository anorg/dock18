from django import template
from django.conf import settings
from django.core.urlresolvers import reverse

from django.contrib.contenttypes.models import ContentType

from spectators.models import Spectate


register = template.Library()


class SpectatesNode(template.Node):
    
    def __init__(self, user, model_list, varname):
        self.user = template.Variable(user)
        self.model_list = [template.Variable(m) for m in model_list]
        self.varname = varname
    
    def render(self, context):
        user = self.user.resolve(context)
        content_types = []
        for model_name in self.model_list:
            app, model = model_name.resolve(context).split(".")
            content_type = ContentType.objects.get(app_label=app, model__iexact=model)
            content_types.append(content_type)
        context[self.varname] = Spectate.objects.filter(
            sender=user,
            receiver_content_type__in=content_types
        )
        return ""


class SpectatorsNode(template.Node):
    
    def __init__(self, object_id, varname):
        self.object_id = template.Variable(object_id)
        
        self.varname = varname
    
    def render(self, context):
        # object_id = self.object_id.resolve(self.object_id)
        
        object_id = self.object_id.resolve(context)
        
        print object_id
        
        
        
        
        content_types = []
            
        context[self.varname] = Spectate.objects.filter(
            # sender=user,
            receiver_object_id__in=(object_id,)
            # receiver_content_type__in=(56,)
        )
        return ""


@register.tag
def spectates(parser, token):
    """
    {% spectates user "app.Model" "app.Model" "app.Model" as spectate_objs %}
    """
    tokens = token.split_contents()
    user = tokens[1]
    varname = tokens[-1]
    model_list = tokens[2:-2]
    return SpectatesNode(user, model_list, varname)


@register.tag
def spectators(parser, token):

    tag_name, object_id, xas,  varname  = token.split_contents()

    return SpectatorsNode(object_id, varname)


@register.filter
def spectates_count(obj):
    """
    Something spectate:
    
        <div class="spectates_count">{{ obj|spectates_count }}</div>
    
    will render:
    
        <div class="spectates_count">34</div>
    """
    return Spectate.objects.filter(
        receiver_content_type=ContentType.objects.get_for_model(obj),
        receiver_object_id=obj.pk
    ).count()


@register.inclusion_tag("spectators/_css.html")
def spectates_css():
    return {"STATIC_URL": settings.STATIC_URL}


@register.inclusion_tag("spectators/_widget.html")
def spectates_widget(user, obj, spectate_link_id="spectates", spectate_span_total_class="spectators-count", toggle_class="spectators-spectated"):
    spectates_count = Spectate.objects.filter(
       receiver_content_type = ContentType.objects.get_for_model(obj),
       receiver_object_id = obj.pk
    ).count()
    return {
        "spectate_link": spectate_link_id,
        "spectate_span_total": spectate_span_total_class,
        "spectates_count": spectates_count
    }


@register.inclusion_tag("spectators/_script.html")
def spectates_js(user, obj, spectate_link="#spectates", spectate_span_total=".spectators-count", toggle_class="spectators-spectated"):
    ct = ContentType.objects.get_for_model(obj)
    """"""
    url = reverse("spectators_spectate_toggle", kwargs={
        "content_type_id": ct.id,
        "object_id": obj.pk
    })

    spectated = Spectate.objects.filter(
       sender = user,
       receiver_content_type = ContentType.objects.get_for_model(obj),
       receiver_object_id = obj.pk
    ).exists()
    if spectated:
        is_spectated = toggle_class
    else:
        is_spectated = ""
    return {
        "STATIC_URL": settings.STATIC_URL,
        "spectate_url": url,
        "spectate_link": spectate_link,
        "spectate_span_total": spectate_span_total,
        "toggle_class": toggle_class,
        "is_spectated": is_spectated
    }


class SpectatedObjectsNode(template.Node):
    
    def __init__(self, objects, user, varname):
        self.objects = template.Variable(objects)
        self.user = template.Variable(user)
        self.varname = varname
    
    def get_objects(self, user, objects):
        is_stream = None
        get_id = None
        indexed = {}
        
        for obj in objects:
            if hasattr(obj, "cast") and callable(obj.cast):
                obj = obj.cast()
            if is_stream is None and get_id is None:
                is_stream = not hasattr(obj, "_meta")
                get_id = lambda x: is_stream and x.item.id or x.id
            
            ct = ContentType.objects.get_for_model(is_stream and obj.item or obj)
            if ct not in indexed.keys():
                indexed[ct] = []
            obj.spectated = False
            indexed[ct].append(obj)
        
        for ct in indexed.keys():
            spectates = Spectate.objects.filter(
                sender=user,
                receiver_content_type=ct,
                receiver_object_id__in=[get_id(o) for o in indexed[ct]]
            )
            
            for obj in indexed[ct]:
                for spectate in spectates:
                    if spectate.receiver_object_id == get_id(obj):
                        obj.spectated = True
                yield obj
    
    def render(self, context):
        user = self.user.resolve(context)
        objects = self.objects.resolve(context)
        context[self.varname] = self.get_objects(user, objects)
        return ""


@register.tag
def spectated(parser, token):
    """
    {% spectated objects by user as varname %}
    """
    tag, objects, _, user, _, varname = token.split_contents()
    return SpectatedObjectsNode(objects, user, varname)
