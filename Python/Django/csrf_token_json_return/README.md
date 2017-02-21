# Csrf token in return json data

``` python
from django.http import JsonResponse
from django.middleware.csrf import get_token


def token_get(request):
    csrf_token = get_token(request)
    return JsonResponse({'csrf_token': csrf_token})
```

