values = [None, False, True, 0, 1, "", "hello", [], [1]]

for value in values:
    if value:
        print(f"{repr(value)} is truthy")
    else:
        print(f"{repr(value)} is falsy")

print("---")


def display_name(user):
    name = user.get("name")

    return name or "Guest"


print(display_name({"name": "Ada"}))
print(display_name({"name": ""}))
print(display_name({}))
