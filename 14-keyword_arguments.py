# Python 參數可以有預設值，呼叫時用 keyword 會更清楚。
def create_user(name, role="member", active=True):
    return {
        "name": name,
        "role": role,
        "active": active,
    }


print(create_user("Ada"))
print(create_user("Grace", role="admin"))
print(create_user("Linus", active=False))

print("---")


# * 之後嘅參數必須用 keyword 傳入。
def send_email(to, *, subject, body=""):
    return f"To: {to} | Subject: {subject} | Body: {body}"


print(send_email("ada@example.com", subject="Welcome"))
print(send_email("grace@example.com", subject="Deploy", body="Finished"))
