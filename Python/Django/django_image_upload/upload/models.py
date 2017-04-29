from django.db import models


class Images(models.Model):
    image_name = models.CharField(max_length=200)

    def __str__(self):
        return self.image_name
