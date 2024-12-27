def test_login_page(client):
    """Тест страницы логина"""
    response = client.get('/auth/login')
    assert response.status_code == 200
    assert b"Вход" in response.data

def test_login_success(client, create_user):
    """Тест успешной авторизации"""
    create_user('testuser', 'password123')
    response = client.post('/auth/login', data={
        'login': 'testuser',
        'password': 'password123'
    }, follow_redirects=True)
    assert b"Вы успешно аутентифицированы" in response.data

def test_login_failure(client, create_user):
    """Тест неудачной авторизации"""
    create_user('testuser', 'password123')
    response = client.post('/auth/login', data={
        'login': 'testuser',
        'password': 'wrongpassword'
    })
    assert b"Неверный логин или пароль" in response.data
