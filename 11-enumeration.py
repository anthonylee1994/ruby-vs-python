# Python comprehension、generator expression 同 enumerate 係常見資料處理組合。
users = [
    {"name": "Ada", "score": 95},
    {"name": "Grace", "score": 82},
    {"name": "Linus", "score": 70},
]

names = [user["name"] for user in users]
passed = [user for user in users if user["score"] >= 80]
total_score = sum(user["score"] for user in users)

print(names)
print(passed)
print(total_score)

print("---")

# enumerate(..., start=1) 可以令顯示編號由 1 開始。
for index, user in enumerate(users, start=1):
    print(f"{index}. {user['name']}")

print("---")

score_by_name = {user["name"]: user["score"] for user in users}

print(score_by_name)
