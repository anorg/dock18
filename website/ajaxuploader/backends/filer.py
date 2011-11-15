from io import FileIO, BufferedWriter
import os

from django.conf import settings
from django.core.files import File as DjangoFile
from ajaxuploader.backends.base import AbstractUploadBackend

from django.db import models

#from filer import *

from bcast.models import Event
# from filer.models.filemodels import *
# from ajaxuploader.models import *

class FilerUploadBackend(AbstractUploadBackend):
    
    UPLOAD_DIR = "uploads"

    def setup(self, filename):
        self._path = os.path.join(
            settings.MEDIA_ROOT, self.UPLOAD_DIR, filename)
        try:
            os.makedirs(os.path.realpath(os.path.dirname(self._path)))
        except:
            pass
        self._dest = BufferedWriter(FileIO(self._path, "w"))

    def upload_chunk(self, chunk):
        self._dest.write(chunk)

    def upload_complete(self, request, filename):
        

        
        self.filer_store(request, filename)
        
        path = settings.MEDIA_URL + self.UPLOAD_DIR + "/" + filename
        self._dest.close()
        return {"path": path,"backend": 'filer'}
    
    
    def filer_store(self, request, filename):
        
        
        
        event_id = request.GET['event_id']
        
        event = Event.objects.get(pk=event_id)
        
        # folder = event.get_folder('uploads')
        
        event.add_file(self._path, 'uploads', filename, request.user)
        
        #file = models.ForeignKey('filer.models.filemodels.File')
        #folder = models.ForeignKey('filer.models.foldermodels.Folder')
        
        print self._path
        
        print event.key
        
        print 'event id: ',
        print event_id
