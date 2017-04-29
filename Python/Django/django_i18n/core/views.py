from django.shortcuts import render
from django.utils.translation import ugettext as _


def index(request):
    return render(request, 'index.djhtml', {
        'appname': _('name'),
        'default': _('default'),
        'another': 'another thing',
    })
