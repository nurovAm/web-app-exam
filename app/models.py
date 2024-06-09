import os
from typing import Optional, Union, List
from datetime import datetime
import sqlalchemy as sa
from werkzeug.security import check_password_hash, generate_password_hash
from flask_login import UserMixin
from flask import url_for
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import DeclarativeBase
from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy import String, ForeignKey, DateTime, Text, Integer, MetaData
import markdown
import app
from user_policy import UsersPolicy

RATING_BOOK = {
    5: 'Отлично',
    4: 'Хорошо',
    3: 'Удовлетворительно',
    2: 'Неудовлетворительно',
    1: 'Плохо',
    0: 'Ужасно',
}

class Base(DeclarativeBase):
  metadata = MetaData(naming_convention={
        "ix": 'ix_%(column_0_label)s',
        "uq": "uq_%(table_name)s_%(column_0_name)s",
        "ck": "ck_%(table_name)s_%(constraint_name)s",
        "fk": "fk_%(table_name)s_%(column_0_name)s_%(referred_table_name)s",
        "pk": "pk_%(table_name)s"
    })

db = SQLAlchemy(model_class=Base)



class Book(Base):
    __tablename__ = 'book'

    id: Mapped[int] =  mapped_column(Integer, primary_key=True)
    name: Mapped[str] = mapped_column(String(100), nullable=False)
    publisher_year: Mapped[int] = mapped_column(Integer, nullable=False)
    publisher: Mapped[str] = mapped_column(String(255), nullable=False)
    author: Mapped[str] = mapped_column(String(255), nullable=False)
    size: Mapped[int] = mapped_column(Integer, nullable=False)
    id_cover: Mapped[Optional[int]] = mapped_column(ForeignKey("cover.id"))


    @property
    def score(self):
        sum = 0
        reviews = Review.query.filter(Review.review_status_id == 2).filter(Review.book_id == self.id).all()

        for review in reviews:
            sum += review.rating

        try:
            return sum / len(self.reviews)
        except ZeroDivisionError:
            return 0.0

    @property
    def reviews_count(self):
        reviews = Review.query.filter(Review.review_status_id == 2).filter(Review.book_id == self.id).all()
        return len(reviews)

    @property
    def formatted_description(self):
        return markdown(self.short_description)

    def __repr__(self):
        return '<Book %r>' % self.name
    
class Cover(Base):
    __tablename__ = "cover"

    id: Mapped[str] = mapped_column(String(100), primary_key=True)
    file_name: Mapped[str] = mapped_column(String(100))
    mime_type: Mapped[str] = mapped_column(String(100))
    md5_hash: Mapped[str] = mapped_column(String(100), unique=True)

    def __repr__(self):
        return '<Cover %r>' % self.file_name

    @property
    def storage_filename(self):
        _, ext = os.path.splitext(self.file_name)
        return self.id + ext

    @property
    def url(self):
        return url_for('cover', cover_id=self.id)


class Review(db.Model):
    __tablename__ = 'review'

    id = db.Column(db.Integer, primary_key=True)
  
    book_id = db.Column(db.Integer, db.ForeignKey('book.id'))
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    rating = db.Column(db.Integer, nullable=False)
    text = db.Column(db.Text, nullable=False)
    created_at = db.Column(db.DateTime,
                           nullable=False,
                           server_default=sa.sql.func.now())
    book = db.relationship('Book')
    user = db.relationship('User')

    @property
    def rating_word(self):
        return RATING_BOOK.get(self.rating)

    def __repr__(self):
        return '<Review %r>' % self.id
    

class User(Base, UserMixin):
    __tablename__ = 'user'

    id: Mapped[int] = mapped_column(primary_key=True)
    first_name: Mapped[str] = mapped_column(String(100), nullable=False)
    last_name: Mapped[str] = mapped_column(String(100), nullable=False)
    middle_name: Mapped[Optional[str]] = mapped_column(String(100))
    login: Mapped[str] = mapped_column(String(100), unique=True, nullable=False)
    password_hash: Mapped[str] = mapped_column(String(200), nullable=False)
    role_id: Mapped[Optional[int]] = mapped_column(ForeignKey("role.id"), nullable=False) 
    

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)

    @property
    def full_name(self):
        return ' '.join([self.last_name, self.first_name, self.middle_name or ''])

    @property
    def is_admin(self):
        return app.config.get('ADMIN_ROLE_ID') == self.role_id

    @property
    def is_moderator(self):
        return app.config.get('MODERATOR_ROLE_ID') == self.role_id

    @property
    def is_user(self):
        return app.config.get('USER_ROLE_ID') == self.role_id

    def can(self, action, book_id = None):
        user_policy = UsersPolicy(book_id)
        method = getattr(user_policy, action)
        if method is not None: return method()
        else: return False


    def __repr__(self):
        return '<User %r>' % self.login
    

class Role(Base):
    __tablename__ = "role"

    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(255), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=False)