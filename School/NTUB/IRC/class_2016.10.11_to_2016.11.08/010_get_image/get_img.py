import requests


img = requests.get('https://3.bp.blogspot.com/-W__wiaHUjwI/Vt3Grd8df0I/AAAAAAAAA78/7xqUNj8ujtY/s1600/image02.png')
with open('./img.png', 'wb') as f:
    for chunk in img:
        f.write(chunk)
