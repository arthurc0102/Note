``` python
import base64

from django.contrib import auth, messages
from django.core.mail import EmailMultiAlternatives
from django.contrib.auth import views as v
from django.template import loader
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.shortcuts import render, redirect, reverse, get_object_or_404
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required

from core.settings.secret import email

from . import forms as f
from .models import APIKey


def create(request):
    form = f.UserModelForm(request.POST or None)
    if form.is_valid():
        user = form.save()
        APIKey.objects.create(user=user)
        # send set password email
        token_generator = PasswordResetTokenGenerator()
        subject = 'Set Password'
        to_emails = [user.email]
        from_email = email['USER']
        context = {
            'protocol': 'https' if request.is_secure() else 'http',
            'domain': request.get_host(),
            'uid': base64.b64encode(bytes(str(user.pk), 'utf-8')).decode('utf-8').replace('=', ''),
            'token': token_generator.make_token(user),
        }
        email_message = EmailMultiAlternatives(subject, ' ', from_email, to_emails)
        html_email = loader.render_to_string('reset_email/content_html.html', context)
        email_message.attach_alternative(html_email, 'text/html')
        email_message.send()
        return redirect(index)

    return render(request, 'users/create.html', {'form': form})
```
