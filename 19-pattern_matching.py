# Python match/case 可以按 dict/list 形狀拆值同加 guard。
def describe_event(event):
    match event:
        case {"type": "login", "user": user}:
            return f"{user} logged in"
        case {"type": "purchase", "user": user, "amount": amount} if amount >= 100:
            return f"{user} made a large purchase"
        case {"type": "purchase", "user": user, "amount": amount}:
            return f"{user} spent ${amount}"
        case _:
            return "Unknown event"


events = [
    {"type": "login", "user": "Ada"},
    {"type": "purchase", "user": "Grace", "amount": 120},
    {"type": "purchase", "user": "Linus", "amount": 40},
    {"type": "logout"},
]

for event in events:
    print(describe_event(event))

print("---")


# sequence pattern 可以攞頭兩個值，再用 *rest 收起剩低嘅元素。
def first_two(values):
    match values:
        case [first, second, *rest]:
            return f"{first}, {second}, rest={rest}"
        case _:
            return "Need at least two values"


print(first_two([1, 2, 3, 4]))
print(first_two([1]))
