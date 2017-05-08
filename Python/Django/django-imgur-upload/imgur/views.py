import requests

from base64 import b64encode

from django.http import JsonResponse
from django.shortcuts import render

from core.settings import IMGUR_CLIENT_ID


def upload_to_imgur(request):
    if request.POST and request.FILES:
        res = requests.post(
            url='https://api.imgur.com/3/image.json',
            headers={'Authorization': 'Client-ID ' + IMGUR_CLIENT_ID},
            data={
                'title': 'dog_music',
                'image': b64encode(request.FILES.get('file').read())
            }
        )
        return JsonResponse(res.json())

    return render(request, 'index.html')
