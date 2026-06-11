# Python 用 try/except/else/finally 分清成功、失敗同收尾動作。
def parse_age(value):
    try:
        age = int(value)
    except ValueError:
        return "Invalid age"
    else:
        return f"Age: {age}"
    finally:
        print(f"Finished parsing {value}")


print(parse_age("42"))
print("---")
print(parse_age("abc"))

print("---")


# 自訂 Exception class 可以令 except 捕捉範圍清楚啲。
class PaymentError(Exception):
    pass


def charge(amount):
    if amount <= 0:
        raise PaymentError("Amount must be positive")

    return f"Charged ${amount}"


try:
    print(charge(0))
except PaymentError as error:
    print(f"Payment failed: {error}")
