# Python class 會經 self 擺屬性同呼叫 method，寫法比較顯式。
class User:
    def __init__(self, name, role):
        self.name = name
        self.role = role

    def is_admin(self):
        return self.role == "admin"


user = User("Ada", "admin")

print(user.name)
print(user.role)
print(user.is_admin())
