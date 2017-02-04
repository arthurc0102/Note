# flash messages

views.py
``` python

from django.contrib import messages


def index():
    messages.add_message(request, messages.INFO, 'Hello world.')
```

index.djhtml

``` html+django
{% if messages %}
<ul class="messages">
    {% for message in messages %}
    <li{% if message.tags %} class="{{ message.tags }}"{% endif %}>{{ message }}</li>
    {% endfor %}
</ul>
{% endif %}
```
