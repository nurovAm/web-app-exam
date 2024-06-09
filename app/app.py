from flask import Flask

app = (__name__)
app = Flask(__name__)
application = app



@app.route('/')
def index():
    return "Hello world!"