# Python string 通常用 f-string 做插值，方法名會比較明確。
name = "Python"

print(f"Hello, {name}")
print(name.upper())
print(name.lower())
print("th" in name)
print(name[0])
print(len(name))

words = "ruby,python,javascript"
print(" | ".join(words.split(",")))
