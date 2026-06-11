# Ruby File API 可以直接寫、讀、append，再記得清理臨時檔。
path = 'tmp-ruby-file.txt'

File.write(path, "Ada\nGrace\nLinus\n")

lines = File.readlines(path, chomp: true)
uppercased = lines.map(&:upcase)

p lines
p uppercased

puts '---'

# block 版 File.open 會自動 close file。
File.open(path, 'a') do |file|
  file.write("Matz\n")
end

File.readlines(path, chomp: true).each do |line|
  puts "- #{line}"
end

File.delete(path)
