# Ruby Enumerable chain 可以表達「篩選、轉換、攤平」呢類流程。
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

puts '---'

# map + uniq/to_h 可以快速由 list 砌出集合或 lookup。
unique_lengths = %w[ruby python rails django].map(&:length).uniq
lookup = %w[ruby python rails].to_h { |word| [word, word.length] }

p unique_lengths
p lookup
