def parse_age(value)
  age = Integer(value)
  "Age: #{age}"
rescue ArgumentError
  "Invalid age"
ensure
  puts "Finished parsing #{value}"
end

puts parse_age("42")
puts "---"
puts parse_age("abc")

puts "---"

class PaymentError < StandardError
end

def charge(amount)
  raise PaymentError, "Amount must be positive" if amount <= 0

  "Charged $#{amount}"
end

begin
  puts charge(0)
rescue PaymentError => error
  puts "Payment failed: #{error.message}"
end
