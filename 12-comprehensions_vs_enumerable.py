# Python comprehension 可以將篩選、轉換、巢狀迴圈寫成一行。
numbers = [1, 2, 3, 4, 5]

doubled_evens = [number * 2 for number in numbers if number % 2 == 0]
labels = [f"item-{number}" for number in numbers]
matrix = [[row, column] for row in range(1, 3) for column in range(1, 4)]

print(doubled_evens)
print(labels)
print(matrix)

print("---")

# set/dict comprehension 可以直接砌出唯一值集合同 lookup。
unique_lengths = {len(word) for word in ["ruby", "python", "rails", "django"]}
lookup = {word: len(word) for word in ["ruby", "python", "rails"]}

print(unique_lengths)
print(lookup)
