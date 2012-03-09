from django.contrib import admin
from cms.admin.placeholderadmin import PlaceholderAdmin
from bcast.models import Season, Event, Channel

class EventInline(admin.TabularInline):
    model = Event
    extra = 1
    
class EventAdmin(PlaceholderAdmin): 
    fieldsets = [
        (None,               {'fields': ['title', 'excerpt', 'location', 'slug']}),
        ('CMS content', {'fields': ['placeholder_1'], 'classes': ['plugin-holder', 'plugin-holder-nopage']}),
        ('Tags & co',               {'fields': ['type', 'tags', 'picture', 'intro', 'folder', 'key']}),
        ('Date information', {'fields': ['Season', 'channel', 'date_start', 'date_end'], 'classes': ['false']}),
        ('Gadgets',   {'fields': ['transmission', 'chat', 'room', 'filebrowser', 'show_spectators']}),
    ]
    readonly_fields = ('key',)
    
admin.site.register(Event, EventAdmin)


class SeasonAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': ['title', 'date_start', 'date_end']}),
    ]
    #inlines = [EventInline]
    #list_display = ('question', 'pub_date', 'was_published_today')
    list_filter = ['date_start']
    #search_fields = ['question']
    #date_hierarchy = 'pub_date'

admin.site.register(Season, SeasonAdmin)


class ChannelAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': ['title', 'excerpt']}),
    ]
    #inlines = [EventInline]
    #list_display = ('question', 'pub_date', 'was_published_today')
    #list_filter = ['date_start']
    #search_fields = ['question']
    #date_hierarchy = 'pub_date'

admin.site.register(Channel, ChannelAdmin)


