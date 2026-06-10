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
