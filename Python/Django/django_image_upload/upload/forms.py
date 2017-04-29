from django import forms
from django.forms import Form


class UploadImage(Form):
    image = forms.ImageField()
