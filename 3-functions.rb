# Ruby method 最後一行會自動成為回傳值，所以好多時唔使寫 return。
def greet(name)
  "Hello, #{name}"
end

def total_price(price, tax_rate: 0.0)
  price + (price * tax_rate)
end

puts greet('Ruby')
puts total_price(100, tax_rate: 0.08)
