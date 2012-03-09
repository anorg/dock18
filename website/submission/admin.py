from django.contrib import admin
from submission.models import *

    
class SubmissionAdmin(admin.ModelAdmin): 
    list_display = ('name', 'date_start', 'date_end')
    pass
    
admin.site.register(Submission, SubmissionAdmin)    


class EntryAdmin(admin.ModelAdmin): 
    list_display = ('user', 'submission', 'url', 'state')
    list_filter = ('submission', 'state')
    
admin.site.register(Entry, EntryAdmin)

class SeriesAdmin(admin.ModelAdmin): 
    pass
    
admin.site.register(Series, SeriesAdmin)




