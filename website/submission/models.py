from django.db import models
import datetime
from django.contrib.auth.models import User
from django.utils.translation import ugettext as _
# Create your models here.
from cms.models import CMSPlugin

# model extensions
from mptt.models import MPTTModel, TreeForeignKey


class Series(models.Model):
    name = models.CharField(max_length=200)
    excerpt = models.TextField(blank=True, null=True)

    class Meta:
        verbose_name = _('Series')
        verbose_name_plural = _('Series')
        ordering = ('name', )
        
    # own name
    def __unicode__(self):
        return self.name

class Submission(MPTTModel):
    name = models.CharField(max_length=200)
    teaser = models.CharField(max_length=200, blank=True, null=True)
    excerpt = models.TextField(blank=True, null=True)
    date_start = models.DateTimeField('date start', default=datetime.datetime.now())
    date_end = models.DateTimeField('date end', default=datetime.datetime.now())
    
    parent = TreeForeignKey('self', null=True, blank=True)
    
    series = models.ForeignKey(Series)

    class Meta:
        verbose_name = _('Submission')
        verbose_name_plural = _('Submissions')
        ordering = ('date_start', )
        
    # own name
    def __unicode__(self):
        return '%s | %s to %s' % (self.name, str(self.date_start), str(self.date_end))
    
    def is_active(self):

        if self.date_start < datetime.datetime.now() and self.date_end > datetime.datetime.now():
            return True
        
        return False
    
    def get_state(self):

        if self.date_start < datetime.datetime.now() and self.date_end > datetime.datetime.now():
            return 'running'

        if self.date_start > datetime.datetime.now():
            return 'future'
        else:
            return 'over'
        
        
    def user_allowed(self, user):
        
        if not self.parent:
            return True
        
        else:
            
            try:
                pe = Entry.objects.filter(user=user, submission=self.parent)[0]

                if pe.state == 'accepted':
                    return True
                
            except Exception, e:
                print e
                return False
            
            return False
        
    
    
    

class Entry(models.Model):
    user = models.ForeignKey(User)
    submission = models.ForeignKey(Submission)

    url = models.URLField(help_text=_("Inklusive http://"))
    description = models.TextField(help_text=_("Ein/zwei Saetze zu deiner Einreichung."), max_length=512,blank=True, null=True)
    
    STATE_CHOICES = (
        ('pending', _('Pending')),
        ('accepted', _('Accepted')),
        ('dismissed', _('Dismissed')),
    )
    state = models.CharField(max_length=24, default='pending', choices=STATE_CHOICES)

    class Meta:
        verbose_name = _('Entry')
        verbose_name_plural = _('Entries')
        ordering = ('submission', )
        
    # own name
    def __unicode__(self):
        return self.url
    
    

class SubmissionPlugin(CMSPlugin):
    submission = models.ForeignKey(Submission)
    
    def __unicode__(self):
        return 'Submission: %s' % self.submission.name