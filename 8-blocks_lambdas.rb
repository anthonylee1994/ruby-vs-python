def repeat(times, &block)
  times.times(&block)
end

repeat(3) do |index|
  puts "Ruby block ##{index + 1}"
end

puts '---'

def build_multiplier(number)
  lambda do |value|
    value * number
  end
end

double = build_multiplier(2)
triple = build_multiplier(3)

puts double.call(10)
puts triple.call(10)

puts '---'

numbers = [1, 2, 3, 4]
squares = numbers.map { |number| number * number }
evens = numbers.select { |number| number.even? }

p squares
p evens
