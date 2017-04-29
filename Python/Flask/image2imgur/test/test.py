import requests
from base64 import b64encode


URL = 'https://api.imgur.com/3/image.json'
CLIENT_ID = '7d36f2cd0112cca'


def main():
    with open('.\\upload_files\\test.jpg', 'rb') as image:
        client = requests.Session()
        http_header = {'Authorization': 'Client-ID ' + CLIENT_ID}
        post_data = {'image': b64encode(image.read())}
        upload_result = client.post(url=URL,
                                    data=post_data,
                                    headers=http_header)

        print(upload_result.text)


if __name__ == '__main__':
    main()
