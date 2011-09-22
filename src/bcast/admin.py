from django.contrib import admin

from bcast.models import *







class EventInline(admin.TabularInline):
    model = Event
    extra = 1
    
    
class EventAdmin(admin.ModelAdmin): 
    fieldsets = [
        (None,               {'fields': ['title', 'excerpt']}),
        ('Tags & co',               {'fields': ['type', 'tags', 'picture']}),
        #('Guests',               {'fields': ['participants']}),
        ('Date information', {'fields': ['Season', 'date_start', 'date_end'], 'classes': ['false']}),
        ('Gadgets',   {'fields': ['transmission', 'chat', 'filebrowser']}),
    ]
    
class SeasonAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': ['title', 'date_start', 'date_end']}),
#        ('Date information', {'fields': ['pub_date'], 'classes': ['collapse']}),
    ]
    inlines = [EventInline]
    #list_display = ('question', 'pub_date', 'was_published_today')
    list_filter = ['date_start']
    #search_fields = ['question']
    #date_hierarchy = 'pub_date'

admin.site.register(Season, SeasonAdmin)

admin.site.register(Event, EventAdmin)

admin.site.register(Playlist)
admin.site.register(Clip)