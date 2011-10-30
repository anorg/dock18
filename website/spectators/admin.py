# -*- coding: utf-8 -*-

from models import Spectate
from django.contrib import admin


class SpectateAdmin(admin.ModelAdmin):
    list_display = ('sender', 'receiver')


admin.site.register(Spectate, SpectateAdmin)

