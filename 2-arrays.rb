# Ruby array 配合 Enumerable 方法，寫 map/select/sum 會好順手。
numbers = [1, 2, 3, 4, 5]

puts numbers.first
puts numbers.last
puts numbers.length

doubled = numbers.map { |number| number * 2 }
even_numbers = numbers.select(&:even?)
sum = numbers.sum

puts doubled.inspect
puts even_numbers.inspect
puts sum

numbers << 6
puts numbers.inspect
