import os
import bleach

from flask import Blueprint, flash, redirect, render_template, request, url_for
from flask_login import current_user, login_required

from app import db, app
from models import Book, Review, Category, Role, Cover, User, Collection
from auth import check_rights
from tools import ImageSaver

book_bp = Blueprint('books', __name__, url_prefix='/books')


@book_bp.route('/<int:book_id>')
def show(book_id):
    book = Book.query.get(book_id)
    image = Cover.query.filter(Cover.book_id == book_id).first()
    if current_user.is_authenticated:
        collections = Collection.query.filter(Collection.user_id == current_user.id)
        return render_template('book/show.html', book=book, image=image, collections=collections)
    return render_template('book/show.html', book=book, image=image)


@book_bp.route('/create', methods=['GET', 'POST'])
@login_required
@check_rights('create_book')
def create():
    genres = Category.query.all()
    genres_count = len(genres)
    
    if request.method == 'POST':
        try:
            book = Book()
            book.name = bleach.clean(request.form.get('book_title'))
            book.short_desc = bleach.clean(request.form.get('book_short_description'))
            book.author = bleach.clean(request.form.get('book_author'))
            book.publisher = bleach.clean(request.form.get('book_publisher'))
            book.publisher_year = request.form.get('book_publish_year')
            book.size = request.form.get('book_volume')

            for genre_id in request.form.getlist('book_genres'):
                genre = Category.query.get(genre_id)
                book.genres.append(genre)
            db.session.add(book)

            f = request.files.get('book_img')
            if f and f.filename:
                ImageSaver(f, book).save()

            db.session.commit()

            flash('Книга успешно добавлена.', 'success')
            return redirect(url_for('books.show', book_id=book.id))
        except Exception as e:
            print(e, '=============================================================')
            db.session.rollback()
            flash(
                'При сохранении данных возникла ошибка. Проверьте корректность введённых данных.', 'warning')
            return render_template(
                'book/create.html',
                genres=genres,
                genres_count=genres_count,
                book=book)

    return render_template(
        'book/create.html',
        genres=genres,
        genres_count=genres_count,
        book=None)


@book_bp.route('/<int:book_id>/edit', methods=['GET', 'POST'])
@login_required
@check_rights('update_book')
def edit(book_id):
    genres = Category.query.all()
    genres_count = len(genres)

    book = Book.query.get(book_id)
    image = Cover.query.filter(Cover.book_id == book_id).first()
    collections = Collection.query.filter(Collection.user_id == current_user.id)
    if request.method == 'POST':
        try:
            book.name = bleach.clean(request.form.get('book_title'))
            book.short_desc = bleach.clean(request.form.get('book_short_description'))
            book.author = bleach.clean(request.form.get('book_author'))
            book.publisher = bleach.clean(request.form.get('book_publisher'))
            book.publisher_year = request.form.get('book_publish_year')
            book.size = request.form.get('book_volume')

            genre_list = []
            for genre_id in request.form.getlist('book_genres'):
                genre = Category.query.get(genre_id)
                genre_list.append(genre)

            book.genres = genre_list

            db.session.add(book)

            db.session.commit()

            flash('Книга успешно обновлена.', 'success')
            return render_template('book/show.html', book=book, image=image, collections=collections)
        except:
            db.session.rollback()
            flash(
                'При сохранении данных возникла ошибка. Проверьте корректность введённых данных.', 'warning')
            return render_template(
                'book/edit.html',
                genres=genres,
                genres_count=genres_count,
                book=book,
                publish_year=book.publisher_year)

    return render_template(
        'book/edit.html',
        genres=genres,
        genres_count=genres_count,
        book=book,
        publish_year=book.publisher_year)


@book_bp.route('/<int:book_id>/delete', methods=['POST'])
@login_required
@check_rights('delete_book')
def delete(book_id):
    try:
        book = Book.query.get(book_id)
        image = Cover.query.filter(Cover.book_id == book_id).first()

        if image:
            path_to_img = os.path.join(
                app.config['UPLOAD_FOLDER'], image.storage_filename)

        book.genres.clear()
        book.collectionses.clear()
        db.session.delete(book)
        db.session.commit()

        if image:
            os.remove(path_to_img)
    except:
        flash('Ошибка при удалении книги.', 'warning')
        return redirect(url_for('index'))

    flash('Книга успешно удалена.', 'success')
    return redirect(url_for('index'))


@book_bp.route('/<int:book_id>/create_review', methods=['POST'])
@login_required
@check_rights('read_book')
def create_review(book_id):
    check_review = Review.query.filter_by(book_id=book_id, user_id=current_user.id).first()
    print(check_review, '--------------------------------------------------------')
    if check_review:
        flash('Вы уже оставили отзыв.', 'danger')
    else:
        try:
            review = Review()
            review.rating = request.form.get('review-rating')
            review.text = bleach.clean(request.form.get('review-text'))
            review.book_id = book_id
            review.user_id = current_user.id

            db.session.add(review)
            db.session.commit()

            flash('Рецензия отправлена.', 'success')
            return redirect(url_for('books.show', book_id=book_id))
        except:
            db.session.rollback()
            flash('При создании рецензии возникла ошибка. Проверьте корректность введённых данных.', 'warning')
            return redirect(url_for('books.show', book_id=book_id))
    return redirect(url_for('books.show', book_id=book_id))
    

@book_bp.route('/<int:book_id>/add_book_to_collection', methods=['POST'])
@login_required
@check_rights('add_cllection')
def add_book_to_collection(book_id):
    collection_id = request.form.get('book_to_collection_name')
    book = Book.query.get(book_id)
    collection = Collection.query.get(collection_id)
    fl = False
    for book in collection.books:
        if book.id == book_id:
            fl = True
    if fl:
        flash('Книга уже добавлена в подборку.', 'danger')
    else:
        try:
            book.collectionses.append(collection)
            db.session.add(book)
            db.session.commit()
            flash('Книга добавлена в подборку.', 'success')
            return redirect(url_for('books.show', book_id=book_id))
        except:
            db.session.rollback()
            flash('При добавлении книги в подборку возникла ошибка. Проверьте корректность введённых данных.', 'warning')
            return redirect(url_for('books.show', book_id=book_id))
    return redirect(url_for('books.show', book_id=book_id))