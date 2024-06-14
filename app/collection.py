import os
import bleach

from flask import Blueprint, flash, redirect, render_template, request, url_for
from flask_login import current_user, login_required

from app import db, app
from models import Book, Review, Category, Role, Cover, User, Collection
from auth import check_rights



collection_bp = Blueprint('collections', __name__, url_prefix='/collections')



@collection_bp.route('/', methods=['GET', 'POST'])
@login_required
@check_rights('add_cllection')
def show_all():
    books = Book.query.order_by(Book.publisher_year.desc())
    collections = Collection.query.all()
      
    return render_template('collection/show_collection.html', books=books, collections=collections)



@collection_bp.route('/add', methods=['GET', 'POST'])
@login_required
@check_rights('add_cllection')
def add_collection():
    collections = Collection.query.all()
    try:
        collection = Collection()
        collection.name = bleach.clean(request.form.get('collection_name'))
        collection.user_id = current_user.id

        db.session.add(collection)
        db.session.commit()

        flash('Коллекция успешно добавлена.', 'success')
        return render_template('collection/show_collection.html', collections=collections)
    except:
        db.session.rollback()
        flash('При сохранении данных возникла ошибка. Проверьте корректность введённых данных.', 'warning')
        return render_template('collection/show_collection.html', collections=collections)
    

@collection_bp.route('/<int:collection_id>/show', methods=['GET', 'POST'])
@login_required
@check_rights('add_cllection')
def show(collection_id):
    collections = Collection.query.get(collection_id)
    return render_template('collection/show.html', collections=collections)