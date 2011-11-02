from django import template

from subscribe.forms import SubscribeForm

register = template.Library()



@register.inclusion_tag("subscribe/_subscribe_form.html")
def subscribe_form(user):
    return {"form": SubscribeForm(), "user": user}


@register.inclusion_tag("subscribe/_invited.html")
def subscribe_sent(user):
    return {"invited_list": user.invites_sent.all()}

