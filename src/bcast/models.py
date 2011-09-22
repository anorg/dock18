from django.db import models
from cms.models import CMSPlugin, Page
import datetime
from datetime import timedelta

from cms.utils.placeholder import get_page_from_placeholder_if_exists

from taggit.managers import TaggableManager

from django.template.defaultfilters import slugify

from django.contrib.auth.models import User


# jqchat
from jqchat.models import Room


from django.utils.translation import ugettext as _

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
    
    Season = models.ForeignKey(Season)
    
    date_start = models.DateTimeField('date start', default=datetime.datetime.now())
    date_end = models.DateTimeField('date end', default=datetime.datetime.now())
    
    picture = models.ImageField(upload_to='pictures', blank=True, default=False)
    
    transmission = models.BooleanField('transmission', default=True, help_text=_('Include the stream window?'))
    chat = models.BooleanField('chat', default=True, help_text=_('Include the chat window?'))
    filebrowser = models.BooleanField('filebrowser', default=True, help_text=_('Include the filebrowser window?'))
    
    
    participants = models.ManyToManyField(User, null=True, blank=True, through='Participation')
    
    key = models.CharField(max_length=50)
    
    
    TYPE_CHOICES = (
        ('show', _('Show')),
        ('workshop', _('Workshop')),
        ('other', _('Other')),
    )
    
    type = models.CharField(max_length=24, default='show', choices=TYPE_CHOICES)
    
    # just to keep track...
    created         = models.DateTimeField(auto_now_add=True, editable=False)
    updated         = models.DateTimeField(auto_now=True, editable=False)
    
    published       = ActiveEventsManager()
    objects         = models.Manager()
    
    # jqchat
    room = Room.objects.get(id=1)
    
    
    # pages using - FUCKFUCKFUCK!!
    # pages_using = Page.objects.filter(placeholders__cmsplugin__plugin_type='EventPlugin')
    
    

    
    
    
    #for page in pages:
    #    print page
    
    # enable tagging
    tags = TaggableManager()
    
    
    whatever = 'a whatever'
    
    
    
    class Meta:
        verbose_name = _('Event')
        verbose_name_plural = _('Events')
        ordering = ('-date_start', )
        
             
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

    
    def __unicode__(self):
        return self.title
    
    def is_today(self):
        return self.date_start.date() == datetime.date.today()
    
    def stream_key(self):
        return self.date_start.date()
    
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
        # Place code here, which is excecuted the same
        # time the ``pre_save``-signal would be
        
        self.key = self.generate_key()
        # Call parent's ``save`` function
        super(Event, self).save()

        # Place code here, which is excecuted the same
        # time the ``post_save``-signal would be



class Participation(models.Model):
    user = models.ForeignKey(User)
    event = models.ForeignKey(Event)
    date_joined = models.DateField()









    
class EventPlugin(CMSPlugin):
    
    event = models.ForeignKey(Event)

    def __unicode__(self):
      return self.event.title
    
class EventPlugin_(CMSPlugin):
    model = Event
    
    #event = models.ForeignKey('bcast.Event', related_name='plugins')
    
    #event = models.ForeignKey('bcast.Event', related_name='plugins')

    def __unicode__(self):
      return self.event.title

    
class EventListPlugin(CMSPlugin):
    
    SIZE_CHOICES = (
        ('s', _('Small')),
        ('m', _('Medium')),
        ('l', _('Large')),
        ('xl', _('X-Large')),
    )
    
    size = models.CharField(max_length=2, default='m', choices=SIZE_CHOICES)
    limit = models.IntegerField(default=8)
    
    def testing(self):
      return 'me a string'


    def __unicode__(self):
      return self.size
  
  
  
class Clip(models.Model):
    name = models.CharField(max_length = 50)
    path =  models.FileField(upload_to="track/")
    
    def __unicode__(self):
      return self.name
    
class Playlist(models.Model):
    name = models.CharField(max_length = 50)
    clips = models.ManyToManyField('Clip', through='ClipPlaylist')
    
    def __unicode__(self):
      return self.name

class ClipPlaylist(models.Model):
    playlist = models.ForeignKey('Playlist')
    clip =    models.ForeignKey('Clip')
    position = models.IntegerField() #Here's the crux of the problem

    class Meta:
        ordering = ['position']
