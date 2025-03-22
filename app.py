from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/', methods=['GET'])
def index():
    return jsonify({"message": "Welcome to my Flask App!"})

@app.route('/hello', methods=['GET'])
def hello():
    # Get 'name' from query params, default to "World" if not provided.
    name = request.args.get('name', 'World')
    return jsonify({"message": f"Hello, {name}!"})

if __name__ == '__main__':
    # Run the app on all available interfaces on port 5000.
    app.run(host='0.0.0.0', port=8000, debug=True)
