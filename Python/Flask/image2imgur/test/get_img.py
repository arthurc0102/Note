import requests


r = requests.get(url='https://api.imgur.com/3/image/xp0iAto',
                 headers={'Authorization': 'Client-ID 7d36f2cd0112cca'})

print(r.text)
