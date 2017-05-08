import requests

from base64 import b64encode

CLIENT_ID = 'client id'


def upload():
    with open('./1.jpg', 'rb') as img_file:
        res = requests.post(
            url='https://api.imgur.com/3/image.json',
            headers={'Authorization': 'Client-ID ' + CLIENT_ID},
            data={
                'title': 'dog_music',
                'image': b64encode(img_file.read())
            }
        )
        return res.json()


def get_info(id):
    res = requests.get(
        url='https://api.imgur.com/3/image/{}'.format(id),
        headers={'Authorization': 'Client-ID ' + CLIENT_ID}
    )

    return res.json()


def main():
    res_json = {}
    while True:
        print('get info or upload?')
        choice = input('"i" for get info, "u" for upload: ')
        if choice == 'i':
            id = input('your image id: ')
            res_json = get_info(id)
            break
        elif choice == 'u':
            res_json = upload()
            break

    print('action', 'success' if res_json['success'] else 'fail')
    print('data:', res_json['data'])


if __name__ == '__main__':
    main()
