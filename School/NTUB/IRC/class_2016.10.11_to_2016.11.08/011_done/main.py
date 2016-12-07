# Import
import os
import requests
from parser import Get_web_HTMLParser


# Input sticker url
print('Get some sticker here: https://store.line.me/home/zh-Hant')
url = input('Please input your sticker url: ')

# Get sticker page html
url_result = requests.get(url)
html = url_result.text

# Parse sticker page and get image url
parser = Get_web_HTMLParser()
parser.feed(html)

# Save the image
count = 0
os.system('mkdir \"{0}\"'.format(parser.sticker_name))
for img_url in parser.img_url_list:
    count += 1
    with open('./{0}/{0}_{1}.png'.format(parser.sticker_name,
                                         count), 'wb') as sticker:
        img = requests.get(img_url)
        for chunk in img:
            sticker.write(chunk)

# Finish
print('Done.')
