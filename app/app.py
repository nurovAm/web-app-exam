from flask import Flask, render_template
from flask_migrate import Migrate
from sqlalchemy.exc import SQLAlchemyError
from models import db, Book, Review, Role, Cover, User



app = (__name__)
app = Flask(__name__)
application = app


app.config.from_pyfile('config.py')

db.init_app(app)
migrate = Migrate(app, db)

ADMIN_ROLE_ID = 1
MODERATOR_ROLE_ID = 2
USER_ROLE_ID = 3

from auth import auth_bp, init_login_manager

app.register_blueprint(auth_bp)


init_login_manager(app)
@app.route('/')
def index():
    return render_template("index.html")