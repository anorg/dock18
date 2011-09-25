from django.db import models
import datetime

from cms.models import CMSPlugin, Page
from cms.utils.placeholder import get_page_from_placeholder_if_exists

from taggit.managers import TaggableManager
from django.template.defaultfilters import slugify
from django.contrib.auth.models import User
from django.utils.translation import ugettext as _

# jqchat
from jqchat.models import Room

# django-filer (https://github.com/stefanfoulis/django-filer/blob/develop/docs/usage.rst)


class Season(models.Model):
    title = models.CharField(max_length=200)
    date_start = models.DateTimeField('date start')
    date_end = models.DateTimeField('date end')
    def __unicode__(self):
        return self.title
    def is_today(self):
        return self.date_start.date() == datetime.date.today()
    
    

class ActiveEventsManager(models.Manager):
    """
        Filters out all unpublished and items with a publication date in the future
    """
    def get_query_set(self):
        return super(ActiveEventsManager, self).get_query_set()
    
        """
        return super(ActiveEventsManager, self).get_query_set() \
                    .filter(date_start__lte=datetime.datetime.now()) 
        """
    

class Event(models.Model):
    """
    Event
    """
    
    title = models.CharField(max_length=200)
    excerpt = models.TextField(blank=True)
    
    date_start = models.DateTimeField('date start', default=datetime.datetime.now())
    date_end = models.DateTimeField('date end', default=datetime.datetime.now())
    
    # just to keep track...
    created         = models.DateTimeField(auto_now_add=True, editable=False)
    updated         = models.DateTimeField(auto_now=True, editable=False)
    
    transmission = models.BooleanField('transmission', default=True, help_text=_('Include the stream window?'))
    chat = models.BooleanField('chat', default=True, help_text=_('Include the chat window?'))
    filebrowser = models.BooleanField('filebrowser', default=True, help_text=_('Include the filebrowser window?'))
    
    key = models.CharField(max_length=50)
    TYPE_CHOICES = (
        ('show', _('Show')),
        ('workshop', _('Workshop')),
        ('other', _('Other')),
    )
    type = models.CharField(max_length=24, default='show', choices=TYPE_CHOICES)
    
    Season = models.ForeignKey(Season)
    picture = models.ImageField(upload_to='pictures', blank=True, default=False)
    participants = models.ManyToManyField(User, null=True, blank=True, through='Participation')
    
    published       = ActiveEventsManager()
    objects         = models.Manager()

    room = models.ForeignKey(Room, blank=True, null=True)

    # enable tagging
    tags = TaggableManager()
    
    
    
    # filer 
    # picture = FilerImageField(null=True, blank=True)

    class Meta:
        verbose_name = _('Event')
        verbose_name_plural = _('Events')
        ordering = ('date_start', )
        
    # own name
    def __unicode__(self):
        return self.title
        
    def get_pages_using(self):
        return Page.objects.filter(placeholders__cmsplugin__eventplugin__event=self)
    
    def get_absolute_url(self):
        pages = self.get_pages_using()
        
        url = None
        for page in pages:
            url = page.get_absolute_url()
            
        return url

    def generate_key(self):
        return '%s-%s-%s_%s' % (self.date_start.strftime("%Y"), self.date_start.strftime("%m"), self.date_start.strftime("%d"), slugify(self.title))

    def is_today(self):
        return self.date_start.date() == datetime.date.today()
    
    def starts_in(self):
        
        diff = (datetime.datetime.now() - self.date_start)
        s = (diff.days*86400 + diff.seconds) * -1
        
        if s > 0:
            return s
        
        return 0
    
    def ends_in(self):
        
        diff = (self.date_end - datetime.datetime.now())
        s = (diff.days*86400 + diff.seconds)
        
        if s > 0:
            return s
        
        return 0
         
    def state(self):
        """
        returns 'past', 'today', 'now' or 'future'
        """
        
        if(self.date_start.date() > datetime.date.today()):
            return 'future'
        if(self.date_start.date() < datetime.date.today()):
            return 'past'
        
        if self.date_start.date() == datetime.date.today():
            if self.starts_in() > 0 and self.ends_in() > 0:
                return 'now'
            elif self.starts_in() > 0:
                return 'today'
            else:
                return 'past'
        
        return 'unknown'
        
        
    def save(self):
        self.key = self.generate_key()
        super(Event, self).save()




class Participation(models.Model):
    user = models.ForeignKey(User)
    event = models.ForeignKey(Event)
    date_joined = models.DateTimeField(auto_now_add=True, editable=False)




# cms plugins

  
class EventPlugin(CMSPlugin):
    event = models.ForeignKey(Event)
    
    def __unicode__(self):
        return self.event.title
    

class EventListPlugin(CMSPlugin):
    
    SIZE_CHOICES = (
        ('s', _('Small')),
        ('m', _('Medium')),
        ('l', _('Large')),
        ('xl', _('X-Large')),
    )
    
    # settings, exposed to admin site / plugin
    size = models.CharField(max_length=2, default='m', choices=SIZE_CHOICES)
    limit = models.IntegerField(default=8)

    def __unicode__(self):
        return self.size
  
