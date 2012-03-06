"""
Vimeo plugin
"""
from django.conf import settings


# Width & Height
CMS_VIMEO_DEFAULT_WIDTH = getattr(settings, 'CMS_VIMEO_DEFAULT_WIDTH', 425)
CMS_VIMEO_DEFAULT_HEIGHT = getattr(settings, 'CMS_VIMEO_DEFAULT_HEIGHT', 344)



