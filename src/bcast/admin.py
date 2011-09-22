from django.contrib import admin
from bcast.models import Season, Event

class EventInline(admin.TabularInline):
    model = Event
    extra = 1
    
class EventAdmin(admin.ModelAdmin): 
    fieldsets = [
        (None,               {'fields': ['title', 'excerpt']}),
        ('Tags & co',               {'fields': ['type', 'tags', 'picture']}),
        ('Date information', {'fields': ['Season', 'date_start', 'date_end'], 'classes': ['false']}),
        ('Gadgets',   {'fields': ['transmission', 'chat', 'room', 'filebrowser']}),
    ]
admin.site.register(Event, EventAdmin)


class SeasonAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': ['title', 'date_start', 'date_end']}),
    ]
    inlines = [EventInline]
    #list_display = ('question', 'pub_date', 'was_published_today')
    list_filter = ['date_start']
    #search_fields = ['question']
    #date_hierarchy = 'pub_date'

admin.site.register(Season, SeasonAdmin)


