from django.contrib import admin
from cmsplugin_userlist.models import UserlistPlugin as Userlist

"""
class EventInline(admin.TabularInline):
    model = Event
    extra = 1
"""

class UserlistPluginAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': ['group',]}),
    ]
    #inlines = [EventInline]
    #list_display = ('question', 'pub_date', 'was_published_today')
    #list_filter = ['date_start']
    #search_fields = ['question']
    #date_hierarchy = 'pub_date'

admin.site.register(Userlist, UserlistPluginAdmin)


