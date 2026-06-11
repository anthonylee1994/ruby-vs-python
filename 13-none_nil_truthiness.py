# Python 入面 None、False、0、空字串同空 collection 都係 falsy。
values = [None, False, True, 0, 1, "", "hello", [], [1]]

for value in values:
    if value:
        print(f"{repr(value)} is truthy")
    else:
        print(f"{repr(value)} is falsy")

print("---")


# 用 or 做 fallback 時，空字串都會跌落 Guest。
def display_name(user):
    name = user.get("name")

    return name or "Guest"


print(display_name({"name": "Ada"}))
print(display_name({"name": ""}))
print(display_name({}))
