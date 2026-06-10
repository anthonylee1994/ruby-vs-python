class EmailNotifier
  def notify(message)
    "Email: #{message}"
  end
end

class SmsNotifier
  def notify(message)
    "SMS: #{message}"
  end
end

def send_notification(notifier, message)
  puts notifier.notify(message)
end

notifiers = [
  EmailNotifier.new,
  SmsNotifier.new
]

notifiers.each do |notifier|
  send_notification(notifier, 'Deploy finished')
end

puts '---'

class CreditCardPayment
  def pay(amount)
    "Paid $#{amount} by credit card"
  end
end

class PaypalPayment
  def pay(amount)
    "Paid $#{amount} by PayPal"
  end
end

class StoreCreditPayment
  def pay(amount)
    "Paid $#{amount} with store credit"
  end
end

def checkout(payment_method, amount)
  puts payment_method.pay(amount)
end

payment_methods = [
  CreditCardPayment.new,
  PaypalPayment.new,
  StoreCreditPayment.new
]

payment_methods.each do |payment_method|
  checkout(payment_method, 50)
end

puts '---'

class BankTransfer
  def transfer(amount)
    "Transferred $#{amount} via bank"
  end
end

def process_payment(payment_obj, amount)
  if payment_obj.respond_to?(:pay)
    puts payment_obj.pay(amount)
  elsif payment_obj.respond_to?(:transfer)
    puts payment_obj.transfer(amount)
  else
    puts 'Unknown payment method'
  end
end

mixed_payments = [
  CreditCardPayment.new,
  BankTransfer.new,
  PaypalPayment.new
]

mixed_payments.each do |payment|
  process_payment(payment, 100)
end
