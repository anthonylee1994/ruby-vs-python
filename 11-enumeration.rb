# Ruby Enumerable 將 map/select/sum/each 呢類資料處理串得好自然。
users = [
  { name: 'Ada', score: 95 },
  { name: 'Grace', score: 82 },
  { name: 'Linus', score: 70 }
]

names = users.map { |user| user[:name] }
passed = users.select { |user| user[:score] >= 80 }
total_score = users.sum { |user| user[:score] }

p names
p passed
puts total_score

puts '---'

# with_index(1) 可以令顯示編號由 1 開始。
users.each.with_index(1) do |user, index|
  puts "#{index}. #{user[:name]}"
end

puts '---'

score_by_name = users.to_h { |user| [user[:name], user[:score]] }

p score_by_name
