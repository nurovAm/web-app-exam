from flask import Flask, render_template, send_from_directory, abort, request
from flask_migrate import Migrate
from sqlalchemy.exc import SQLAlchemyError
from models import db, Cover, Book

app = Flask(__name__)
application = app

app.config.from_pyfile('config.py')

db.init_app(app)
migrate = Migrate(app, db)
PER_PAGE = 10


from auth import auth_bp, init_login_manager
from books import book_bp
from collection import collection_bp 

app.register_blueprint(auth_bp)
app.register_blueprint(book_bp)
app.register_blueprint(collection_bp)


PER_PAGE = 5

init_login_manager(app)
@app.route('/')
def index():
    page = request.args.get('page', 1, type=int)

    books = Book.query.order_by(Book.publisher_year.desc())
    pagination = books.paginate(page=page, per_page=PER_PAGE, error_out=False)
    books = pagination.items
    
    return render_template('index.html', books=books, pagination=pagination)

@app.route('/media/images/<string:image_id>')
def image(image_id):
    image = Cover.query.get(image_id)

    if image is None:
        abort(404)

    return send_from_directory(app.config['UPLOAD_FOLDER'], image.storage_filename)