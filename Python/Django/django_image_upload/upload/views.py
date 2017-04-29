from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

from .forms import UploadImage
from .models import Images

from core.settings import MEDIA_URL, MEDIA_ROOT

import os


@csrf_exempt
def index(request):
    form = UploadImage(request.POST, request.FILES)
    if form.is_valid():
        image = request.FILES.get('image', None)
        if image is None:
            return JsonResponse({'success': 'false'})

        with open(os.path.join(MEDIA_ROOT, 'images', image.name), 'wb+') as destination:
            for chunk in image.chunks():
                destination.write(chunk)

        Images.objects.create(image_name=image.name)

        return JsonResponse({
            'success': 'true',
            'data': {
                'filename': image.name,
                'url': '{}{}images/{}'.format(
                    request.get_host(),
                    MEDIA_URL,
                    image.name
                )
            }
        })

    return render(request, 'index.djhtml', {'form': form})
