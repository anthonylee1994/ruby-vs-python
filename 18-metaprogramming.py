class Settings:
    def __init__(self, values):
        self.values = values

    def __getattr__(self, name):
        if name in self.values:
            return self.values[name]

        raise AttributeError(f"Unknown setting: {name}")


settings = Settings({
    "host": "localhost",
    "port": 3000,
})

print(settings.host)
print(settings.port)

print("---")


def add_predicate(class_object, field_name):
    def predicate(self):
        return bool(getattr(self, field_name))

    setattr(class_object, f"has_{field_name}", predicate)


class User:
    def __init__(self, name, email):
        self.name = name
        self.email = email


add_predicate(User, "email")

user = User("Ada", "ada@example.com")

print(user.has_email())
