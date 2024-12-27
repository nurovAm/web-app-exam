def test_index_route(client):
    """Тест главной страницы"""
    response = client.get('/')
    assert response.status_code == 200
    assert b"Welcome" in response.data  # Проверяем содержимое страницы
