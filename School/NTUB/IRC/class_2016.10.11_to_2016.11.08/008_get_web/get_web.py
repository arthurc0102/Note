import requests


r = requests
web = r.get('https://arthurc0102.github.io/test/')

print(web.text)
