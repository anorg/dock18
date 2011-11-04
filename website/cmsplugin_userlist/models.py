from django.db import models
from django.utils.translation import ugettext_lazy as _
from cms.models import CMSPlugin

class UserlistPlugin(CMSPlugin):
    # poll = models.ForeignKey(Poll, verbose_name=_("Poll to display"))

    def __unicode__(self):
        #return self.poll.question
        return 'dummy'

    def __str__(self):
        #return self.poll.question
        return 'dummy'