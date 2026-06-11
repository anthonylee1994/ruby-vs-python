# Ruby hash 好常用 symbol 做 key，例如 :name、:role。
user = {
  name: 'Ada',
  role: 'admin',
  active: true
}

puts user[:name]
puts user[:role]
puts user[:active]

user[:score] = 95

user.each do |key, value|
  puts "#{key}: #{value}"
end
