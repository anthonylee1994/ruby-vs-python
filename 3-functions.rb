def greet(name)
  "Hello, #{name}"
end

def total_price(price, tax_rate: 0.0)
  price + (price * tax_rate)
end

puts greet("Ruby")
puts total_price(100, tax_rate: 0.08)
