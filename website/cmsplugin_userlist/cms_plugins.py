from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from cmsplugin_userlist.models import UserlistPlugin
from django.utils.translation import ugettext as _

class CMSUserlistPlugin(CMSPluginBase):
    # model = UserlistPlugin
    name = _("Userlist plugin, show users in group x")
    render_template = "cmsplugin_Userlist/list.html"
    
    # instance.userlist = 

    def render(self, context, instance, placeholder):
        context.update({
                "objects" : [1, 2],
                })
        return context

plugin_pool.register_plugin(CMSUserlistPlugin)
