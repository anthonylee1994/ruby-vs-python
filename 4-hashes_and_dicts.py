# Python dict 多數用 string 做 key，攞值時要用相同 key。
user = {
    "name": "Ada",
    "role": "admin",
    "active": True,
}

print(user["name"])
print(user["role"])
print(user["active"])

user["score"] = 95

for key, value in user.items():
    print(f"{key}: {value}")
