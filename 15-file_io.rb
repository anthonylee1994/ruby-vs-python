path = 'tmp-ruby-file.txt'

File.write(path, "Ada\nGrace\nLinus\n")

lines = File.readlines(path, chomp: true)
uppercased = lines.map(&:upcase)

p lines
p uppercased

puts '---'

File.open(path, 'a') do |file|
  file.write("Matz\n")
end

File.readlines(path, chomp: true).each do |line|
  puts "- #{line}"
end

File.delete(path)
