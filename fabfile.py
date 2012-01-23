#!/usr/bin/env python
from __future__ import with_statement
from fabric.api import local, settings, abort, run, cd
from fabric.contrib.console import confirm


def clean():
    local("find . -name '*.DS_Store' -type f -delete")
    local("find . -name '*.pyc' -type f -delete")

    
def deploy():
    script_dir = '/var/www/ende.dock18.ch/scripts'
    with settings(host_string='root@node05.daj.anorg.net'):
        with cd(script_dir):
            run('./install_base.sh')

