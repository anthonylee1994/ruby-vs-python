# Ruby regex 可以直接配合 scan/gsub/match 做抽取同替換。
text = 'Order #A123 costs $49.99, order #B456 costs $15.00'

order_ids = text.scan(/#([A-Z]\d+)/).flatten
prices = text.scan(/\$(\d+\.\d{2})/).flatten

p order_ids
p prices

puts '---'

masked = text.gsub(/\$[0-9.]+/, '$XX.XX')

puts masked

puts '---'

# named capture 令 match 結果唔使靠 index 猜欄位。
match = text.match(/#(?<order_id>[A-Z]\d+) costs \$(?<price>\d+\.\d{2})/)

if match
  puts match[:order_id]
  puts match[:price]
end
