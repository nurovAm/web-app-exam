from flask_login import current_user


class UsersPolicy:
    def __init__(self, id=None):
        self.id = id
   

    def create_book(self):
        is_create_user = current_user.is_admin
        return is_create_user

    def read_book(self):
        is_reading_user = current_user.is_authenticated
        return is_reading_user

    def update_book(self):
        is_updating_user = current_user.is_admin or current_user.is_moderator
        return is_updating_user

    def delete_book(self):
        is_deleting_user = current_user.is_admin
        return is_deleting_user

    def moderate_review(self):
        is_moderating_review_user = current_user.is_admin or current_user.is_moderator
        return is_moderating_review_user

    def review_book(self):
        from models import Review
        
        is_reviewing_user = Review.query.filter(
            Review.book_id == self.id).filter(
                Review.user_id == current_user.id).first() is None and current_user.is_authenticated
        return is_reviewing_user
    
    def add_cllection(self):
        is_add_collection = current_user.is_user
        return is_add_collection
    
    def show_collection(self):

        if current_user.id == self.id and current_user.is_user:
            return True
        return False
    
    def show_current_collection(self):
        from models import Collection
        print('----------------------------------------------------', self.id)
        print('----------------------------------------------------', current_user.id)
        print('----------------------------------------------------', current_user.id == self.id)
        is_true = Collection.query.get(self.id)
        if is_true.user_id == current_user.id and current_user.is_user:
            return True
        return False