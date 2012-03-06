from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool

from cmsplugin_soundcloud.models import Soundcloud as SoundcloudModel

from django.utils.translation import ugettext as _

class SoundcloudPlugin(CMSPluginBase):
    model = SoundcloudModel
    name = _("Soundcloud")
    render_template = "cmsplugin_soundcloud/embed.html"

    def render(self, context, instance, placeholder):
        context.update({
            'object': instance,
            'placeholder': placeholder
        })
        return context

plugin_pool.register_plugin(SoundcloudPlugin)
