# Python 通常將 function 或 lambda 當 callback 傳入另一個 function。
def repeat(times, action):
    for index in range(times):
        action(index)


repeat(3, lambda index: print(f"Python lambda #{index + 1}"))

print("---")


# nested function 可以保存外層 number，形成 closure。
def build_multiplier(number):
    def multiplier(value):
        return value * number

    return multiplier


double = build_multiplier(2)
triple = build_multiplier(3)

print(double(10))
print(triple(10))

print("---")


numbers = [1, 2, 3, 4]
squares = list(map(lambda number: number * number, numbers))
evens = list(filter(lambda number: number % 2 == 0, numbers))

print(squares)
print(evens)
