from django.db import models
from django.utils.translation import ugettext_lazy as _

from idios.models import ProfileBase

from filer.fields.image import FilerImageField
from filer.fields.file import FilerFileField


class Profile(ProfileBase):
    name = models.CharField(_("name"), max_length=50, null=True, blank=True)
    
    # picture = models.ImageField(_("profile picture"), upload_to='media/pictures/', blank=True, default=0)
    
    function = models.CharField(_("function"), max_length=50, null=True, blank=True, help_text=_('Function/Job in dock18'))
    
    skype = models.CharField(_("skype"), max_length=50, null=True, blank=True, help_text=_('Only visible for dock18-crew'))
    facebook = models.URLField(_("facebook"), null=True, blank=True, verify_exists=False)
    soundcloud = models.URLField(_("soundcloud"), null=True, blank=True, verify_exists=False)
    
    location = models.CharField(_("location"), max_length=40, null=True, blank=True)
    
    about = models.TextField(_("about"), null=True, blank=True)
    
    
    websites = models.TextField(_("websites"), null=True, blank=True, help_text=_('one url per line, _with_ "http://"'))
    
