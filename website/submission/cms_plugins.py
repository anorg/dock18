from django.db import models
from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from cms.models.pluginmodel import CMSPlugin

from django.utils.translation import ugettext as _

from submission.models import SubmissionPlugin as SubmissionPluginModel



@plugin_pool.register_plugin
class SubmissionPlugin(CMSPluginBase):
    model = SubmissionPluginModel
    name = _("Submission Plugin")
    render_template = "submission/plugins/submission_detail.html"

    def render(self, context, instance, placeholder):

        context.update({
            'submission':instance.submission,
            'object':instance,
            'placeholder':placeholder
        })
        return context



