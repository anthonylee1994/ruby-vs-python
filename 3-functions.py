# Python function 通常明確寫 return，讀起嚟會直接啲。
def greet(name):
    return f"Hello, {name}"


def total_price(price, tax_rate=0.0):
    return price + (price * tax_rate)


print(greet("Python"))
print(total_price(100, tax_rate=0.08))
