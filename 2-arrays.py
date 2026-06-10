numbers = [1, 2, 3, 4, 5]

print(numbers[0])
print(numbers[-1])
print(len(numbers))

doubled = [number * 2 for number in numbers]
even_numbers = [number for number in numbers if number % 2 == 0]
total = sum(numbers)

print(doubled)
print(even_numbers)
print(total)

numbers.append(6)
print(numbers)
