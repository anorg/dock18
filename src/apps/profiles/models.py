from django.db import models
from django.utils.translation import ugettext_lazy as _

from idios.models import ProfileBase


class Profile(ProfileBase):
    name = models.CharField(_("name"), max_length=50, null=True, blank=True)
    
    #picture = models.ImageField(_("profile picture"), upload_to='pictures', blank=True, default=False)
    
    #skype = models.CharField(_("skype"), max_length=50, null=True, blank=True)
    #facebook = models.URLField(_("facebook"), null=True, blank=True, verify_exists=False)
    
    location = models.CharField(_("location"), max_length=40, null=True, blank=True)
    website = models.URLField(_("website"), null=True, blank=True, verify_exists=False)
    
    about = models.TextField(_("about"), null=True, blank=True)
