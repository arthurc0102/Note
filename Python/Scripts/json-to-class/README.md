# Json to Python class

```python
import json


class JSONObject:
    def __init__(self, dict):
        vars(self).update(dict)


json_string = '{"success": true, "data": {"msg": "Hello"}}'
json_object = json.loads(json_string, object_hook=JSONObject)

print(json_object.success)  # True
print(json_object.data.msg)  # Hello
```
