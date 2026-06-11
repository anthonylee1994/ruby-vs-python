# 呢個例子將 discount、tax、receipt 拆成可替換策略。
from dataclasses import dataclass


@dataclass
class Order:
    subtotal: float
    customer_type: str
    country: str


class NoDiscount:
    def apply(self, order):
        return order.subtotal


class VipDiscount:
    def apply(self, order):
        if order.customer_type == "vip":
            return order.subtotal * 0.85

        return order.subtotal


class FlashSaleDiscount:
    def apply(self, order):
        return max(order.subtotal - 20, 0)


class NoTax:
    def calculate(self, amount):
        return 0


class UsTax:
    def calculate(self, amount):
        return amount * 0.08


class EuTax:
    def calculate(self, amount):
        return amount * 0.2


class TextReceipt:
    def render(self, order, discounted_amount, tax):
        total = discounted_amount + tax

        return (
            f"{order.country} order\n"
            f"Subtotal: ${order.subtotal:.2f}\n"
            f"After discount: ${discounted_amount:.2f}\n"
            f"Tax: ${tax:.2f}\n"
            f"Total: ${total:.2f}"
        )


class CsvReceipt:
    def render(self, order, discounted_amount, tax):
        total = discounted_amount + tax

        return (
            "country,customer_type,subtotal,discounted_amount,tax,total\n"
            f"{order.country},{order.customer_type},{order.subtotal:.2f},"
            f"{discounted_amount:.2f},{tax:.2f},{total:.2f}"
        )


class Checkout:
    def __init__(self, discount_policy, tax_policy, receipt_renderer):
        self.discount_policy = discount_policy
        self.tax_policy = tax_policy
        self.receipt_renderer = receipt_renderer

    # Checkout 只依賴每個策略有指定 method，唔需要知道實際 class。
    def receipt_for(self, order):
        discounted_amount = self.discount_policy.apply(order)
        tax = self.tax_policy.calculate(discounted_amount)

        return self.receipt_renderer.render(order, discounted_amount, tax)


orders = [
    Order(subtotal=120, customer_type="regular", country="HK"),
    Order(subtotal=120, customer_type="vip", country="US"),
    Order(subtotal=120, customer_type="regular", country="EU"),
]

checkouts = [
    Checkout(NoDiscount(), NoTax(), TextReceipt()),
    Checkout(VipDiscount(), UsTax(), TextReceipt()),
    Checkout(FlashSaleDiscount(), EuTax(), CsvReceipt()),
]

for checkout, order in zip(checkouts, orders):
    print(checkout.receipt_for(order))
    print("---")
