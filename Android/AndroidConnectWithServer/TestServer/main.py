from flask import Flask, request, jsonify


app = Flask(__name__)


@app.route('/')
def root():
    return 'Hello World'


@app.route('/get')
def get():
    print(request.args)
    return jsonify(request.args)


@app.route('/post', methods=['POST'])
def post():
    print(request.form)
    return jsonify(request.form)


@app.route('/json', methods=['POST'])
def json():
    print(request.get_json())
    return jsonify(request.get_json())


@app.route('/file', methods=['POST'])
def file():
    file = request.files.get('file')
    print(file.filename)
    if file:
        file.save(file.filename)
        return 'file upload'

    return 'Hi'


if __name__ == '__main__':
    app.run(
        host='0.0.0.0',
        port=8000,
        debug=True,
    )
