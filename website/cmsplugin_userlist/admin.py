from django.contrib import admin
from django.contrib.auth.models import User, Group, Permission
from cmsplugin_userlist.models import UserlistPlugin as Userlist

"""
class EventInline(admin.TabularInline):
    model = Event
    extra = 1
"""
"""
class GroupInline(admin.TabularInline):
    model = Group
    extra = 1
"""

class UserlistPluginAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': ['group',]}),
    ]
    #inlines = [GroupInline]
    #inlines = [EventInline]
    #list_display = ('question', 'pub_date', 'was_published_today')
    #list_filter = ['date_start']
    #search_fields = ['question']
    #date_hierarchy = 'pub_date'

admin.site.register(Userlist, UserlistPluginAdmin)


