# values and values_list

> Django ORM

- `models.objects.filter(field='something').values('a')` return `[{'a': 1}, {'a': 2}]`
- `models.objects.filter(field='something').values_list('a')` return `[(1,), (2,)]`
- `models.objects.filter(field='something').values_list('a', flat=True)` return `[1, 2]`
