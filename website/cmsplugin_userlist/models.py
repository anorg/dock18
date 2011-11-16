from django.db import models
from django.utils.translation import ugettext_lazy as _
from cms.models import CMSPlugin

from django.contrib.auth.models import User, Group, Permission

class UserlistPlugin(CMSPlugin):
    # poll = models.ForeignKey(Poll, verbose_name=_("Poll to display"))
    
    group = models.ForeignKey(Group, blank=True, null=True, verbose_name=_("Group to show users from."));

    def __unicode__(self):
        #return self.poll.question
        return 'dummy'

    def __str__(self):
        #return self.poll.question
        return 'dummy'