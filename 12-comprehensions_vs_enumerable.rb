numbers = [1, 2, 3, 4, 5]

doubled_evens = numbers.filter_map do |number|
  number * 2 if number.even?
end
labels = numbers.map { |number| "item-#{number}" }
matrix = (1...3).flat_map do |row|
  (1...4).map do |column|
    [row, column]
  end
end

p doubled_evens
p labels
p matrix

puts "---"

unique_lengths = ["ruby", "python", "rails", "django"].map(&:length).uniq
lookup = ["ruby", "python", "rails"].to_h { |word| [word, word.length] }

p unique_lengths
p lookup
