from django.db import models
from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from cms.models.pluginmodel import CMSPlugin

from django.utils.translation import ugettext as _

from submission.models import SubmissionPlugin as SubmissionPluginModel

from submission.models import Entry, Submission, Series

from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, HttpResponse
from lib.middleware import ForceResponse

from submission.forms import SubmissionEntryForm



class SubmissionPlugin(CMSPluginBase):
    model = SubmissionPluginModel
    name = _("Submission Plugin")
    render_template = "submission/plugins/submission_detail.html"

    def render(self, context, instance, placeholder):

        request = context['request']
        
        user_allowed = True
        
        
        # try to get users entry for this submission
        cs = instance.submission


        if request.user.is_authenticated():
            ue = Entry.objects.filter(user=request.user, submission=instance.submission)
            if ue.count() == 0:
                ue = None
            else:
                ue = ue[0]
        else:
            ue = None

        
        if request.method == 'POST':

            submission_id = int(request.POST['submission_id'])
            current_id = cs.id
            
            if submission_id == current_id:
                
                print 'OK -GOT DA SAME!!!'

                form = SubmissionEntryForm(request.POST or None)
    
                if form.is_valid():
                    print 'VALID'
    
                    if not ue:
                        ue = form.save(commit=False)
                        ue.user = request.user
                        ue.submission = instance.submission
                        
                    else:
                        ue.description = request.POST['description']
                        ue.url = request.POST['url']

                    ue.save()
                    
            else:
                
                form = SubmissionEntryForm(instance=ue)

        else:

            form = SubmissionEntryForm(instance=ue)
            


        """
        Check if user allowed to participate
        Yes - i know that this should be done differently...
        """
        if request.user.is_authenticated() and cs.parent:
            
            user_allowed = cs.user_allowed(request.user);
            #form = None





        context.update({
            'submission': instance.submission,
            'object': instance,
            'user_entry': ue,
            'user_allowed': user_allowed,
            'form': form,
            'placeholder': placeholder
        })
            
        return context

plugin_pool.register_plugin(SubmissionPlugin)


