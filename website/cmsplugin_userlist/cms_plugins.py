from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from cmsplugin_userlist.models import UserlistPlugin
from django.utils.translation import ugettext as _

from django.contrib.auth.models import User, Group, Permission

class CMSUserlistPlugin(CMSPluginBase):
    model = UserlistPlugin
    name = _("Userlist plugin, show users in group x")
    render_template = "cmsplugin_Userlist/user_list.html"
    
    # instance.userlist = 





    def render(self, context, instance, placeholder):
        
        users = User.objects.filter(groups=instance.group)
                
        context.update({
                "objects" : users,
                })
        return context

plugin_pool.register_plugin(CMSUserlistPlugin)
