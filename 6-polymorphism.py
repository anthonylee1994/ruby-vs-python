class EmailNotifier:
    def notify(self, message):
        return f"Email: {message}"


class SmsNotifier:
    def notify(self, message):
        return f"SMS: {message}"


def send_notification(notifier, message):
    print(notifier.notify(message))


notifiers = [
    EmailNotifier(),
    SmsNotifier(),
]

for notifier in notifiers:
    send_notification(notifier, "Deploy finished")

print("---")


class CreditCardPayment:
    def pay(self, amount):
        return f"Paid ${amount} by credit card"


class PaypalPayment:
    def pay(self, amount):
        return f"Paid ${amount} by PayPal"


class StoreCreditPayment:
    def pay(self, amount):
        return f"Paid ${amount} with store credit"


def checkout(payment_method, amount):
    print(payment_method.pay(amount))


payment_methods = [
    CreditCardPayment(),
    PaypalPayment(),
    StoreCreditPayment(),
]

for payment_method in payment_methods:
    checkout(payment_method, 50)

print("---")


class BankTransfer:
    def transfer(self, amount):
        return f"Transferred ${amount} via bank"


def process_payment(payment_obj, amount):
    if hasattr(payment_obj, "pay"):
        print(payment_obj.pay(amount))
    elif hasattr(payment_obj, "transfer"):
        print(payment_obj.transfer(amount))
    else:
        print("Unknown payment method")


mixed_payments = [
    CreditCardPayment(),
    BankTransfer(),
    PaypalPayment(),
]

for payment in mixed_payments:
    process_payment(payment, 100)
