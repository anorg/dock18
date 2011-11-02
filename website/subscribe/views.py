from django import http
from django.utils import simplejson as json
from django.views.decorators.http import require_http_methods

from django.db.models import get_model

from subscribe.forms import SubscribeForm
from subscribe.models import Subscription

from newsletter.core import csv

from django.contrib.admin.views.decorators import staff_member_required

@staff_member_required
def generate_csv(request, model_str="subscribe.subscription", data=None):
    '''
    TODO:
    
    '''

    if not data:
        model = get_model(*model_str.split('.'))
        data = model._default_manager.filter(subscribed=True)
    
    if len(data) == 0:
        data = [["no subscriptions"],]
    return csv.ExcelResponse(data)


@require_http_methods(["POST"])
def invite(request):
    form = SubscribeForm(request.POST)
    if form.is_valid():
        email = form.cleaned_data["email_address"]
        
        instance = Subscription.objects.filter(email=email, subscribed=True)
        
        # instance = Subscription._default_manager.get(email=request.email)
        
        
        if instance.exists():
            data = { "status": "ERROR", "errors": '<ul class="errorlist"><li>%s ist schon angemelded.</li></ul>' % email }
        else:
            instance = Subscription(email=email)
            instance.save()
            data = { "status": "OK", "email": email, "subscriptions_remaining": 123 }
        
        """
        if EmailAddress.objects.filter(email=email, verified=True).exists():
            data = {"status": "ERROR", "errors": '<ul class="errorlist"><li>%s is already on this site</li></ul>' % email}
            
        elif JoinSubscription.objects.filter(from_user=request.user, signup_code__email=email).exists():
            data = {"status": "ERROR", "errors": '<ul class="errorlist"><li>You have already invited %s</li></ul>' % email}
            
        else:
            JoinSubscription.invite(request.user, email)
            data = {
                "status": "OK",
                "email": email,
                "subscriptions_remaining": request.user.subscriptionstat.invites_remaining()
            }
        """ 
            
            
    else:
        data = {"status": "ERROR", "errors": str(form.errors["email_address"])}
        
    return http.HttpResponse(json.dumps(data), content_type="application/json")
