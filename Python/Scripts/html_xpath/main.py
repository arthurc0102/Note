import requests
from lxml import html

r = requests.Session()
page = r.get('http://www.whatismyip.com.tw/').text
tree = html.fromstring(page)

for i in tree.xpath('/html/body/h2'):
    print(i.text)
