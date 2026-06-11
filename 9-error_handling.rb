# Ruby 用 rescue/ensure 處理例外；ensure 無論成功失敗都會執行。
def parse_age(value)
  age = Integer(value)
  "Age: #{age}"
rescue ArgumentError
  'Invalid age'
ensure
  puts "Finished parsing #{value}"
end

puts parse_age('42')
puts '---'
puts parse_age('abc')

puts '---'

# 自訂 error class 可以令呼叫端 rescue 得更精準。
class PaymentError < StandardError
end

def charge(amount)
  raise PaymentError, 'Amount must be positive' if amount <= 0

  "Charged $#{amount}"
end

begin
  puts charge(0)
rescue PaymentError => e
  puts "Payment failed: #{e.message}"
end
