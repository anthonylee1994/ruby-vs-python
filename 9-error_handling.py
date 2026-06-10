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
