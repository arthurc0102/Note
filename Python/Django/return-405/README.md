# Retrun 405

``` python
from django.http import HttpResponseNotAllowed
from django.template.loader import render_to_string


def view(request):
    return HttpResponseNotAllowed(['POST'], render_to_string('405.html'))
```
