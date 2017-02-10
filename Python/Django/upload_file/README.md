# upload file

template: 
```html
<form action="" method="post" enctype="multipart/form-data">
  {% csrf_token %}
  {{ form.as_p }}
  <input type="submit" values="send">
</form>
```

others: <https://docs.djangoproject.com/en/1.10/topics/http/file-uploads/>
