import pytest
from app import app, db
from models import User
import pytest

@pytest.fixture
def client():
    app.config['TESTING'] = True
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'  # Используем SQLite в памяти для тестов
    with app.test_client() as client:
        with app.app_context():
            db.create_all()  # Создаем таблицы в тестовой базе данных
            yield client
            db.session.remove()
            db.drop_all()  # Удаляем таблицы после тестов

@pytest.fixture
def client():
    app.config['TESTING'] = True
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'
    with app.test_client() as client:
        with app.app_context():
            db.create_all()
            yield client
            db.session.remove()
            db.drop_all()

@pytest.fixture
def create_user():
    def _create_user(login, password, is_admin=False):
        user = User(login=login, is_admin=is_admin)
        user.set_password(password)
        db.session.add(user)
        db.session.commit()
        return user
    return _create_user
