import os
import json
import requests
from config import CLIENT_ID  # import client id
from base64 import b64encode
from datetime import datetime
from werkzeug.utils import secure_filename
from flask import Flask, render_template, request


app = Flask(__name__)


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/server', methods=['GET', 'POST'])
def upload_server():
    if request.method == 'GET':
        return render_template('upload_server.html')
    else:
        file = request.files['file']
        now_time = datetime.now().strftime('%Y_%m_%d_%H_%M_%S_%f_')
        filename = '{0}{1}'.format(now_time, secure_filename(file.filename))
        file.save(os.path.join('upload_files', filename))

        return 'upload done'


@app.route('/imgur', methods=['GET', 'POST'])
def upload_imgur():
    if request.method == 'GET':
        return render_template('upload_imgur.html')
    else:
        filename = secure_filename(request.files['file'].filename)
        img_file = request.files['file'].stream.read()
        r = requests.post(url='https://api.imgur.com/3/image.json',
                          headers={'Authorization': 'Client-ID ' + CLIENT_ID},
                          data={'title': filename,
                                'image': b64encode(img_file)})
        j = json.loads(r.text)

        if j['success']:
            img_url = j['data']['link']

            return 'image url: <a href="{0}">{0}</a>'.format(img_url)
        else:
            return 'upload error'


@app.route('/info', methods=['GET', 'POST'])
def get_info():
    if 'link' not in request.args:
        return render_template('get_info.html')
    else:
        img_url = request.args.get('link')
        img_id = img_url.split('/')[len(img_url.split('/')) - 1]

        api_url = 'https://api.imgur.com/3/image/{0}'.format(img_id)
        r = requests.get(url=api_url,
                         headers={'Authorization': 'Client-ID ' + CLIENT_ID})
        j = json.loads(r.text)

        if j['success']:
            return r.text
        else:
            return 'Can\'t get image\'s information'


if __name__ == '__main__':
    app.run(debug=True)
