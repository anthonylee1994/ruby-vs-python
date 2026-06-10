class Order
  attr_reader :subtotal, :customer_type, :country

  def initialize(subtotal:, customer_type:, country:)
    @subtotal = subtotal
    @customer_type = customer_type
    @country = country
  end
end

class NoDiscount
  def apply(order)
    order.subtotal
  end
end

class VipDiscount
  def apply(order)
    return order.subtotal * 0.85 if order.customer_type == "vip"

    order.subtotal
  end
end

class FlashSaleDiscount
  def apply(order)
    [order.subtotal - 20, 0].max
  end
end

class NoTax
  def calculate(amount)
    0
  end
end

class UsTax
  def calculate(amount)
    amount * 0.08
  end
end

class EuTax
  def calculate(amount)
    amount * 0.2
  end
end

class TextReceipt
  def render(order, discounted_amount, tax)
    total = discounted_amount + tax

    [
      "#{order.country} order",
      "Subtotal: $#{format('%.2f', order.subtotal)}",
      "After discount: $#{format('%.2f', discounted_amount)}",
      "Tax: $#{format('%.2f', tax)}",
      "Total: $#{format('%.2f', total)}"
    ].join("\n")
  end
end

class CsvReceipt
  def render(order, discounted_amount, tax)
    total = discounted_amount + tax

    [
      "country,customer_type,subtotal,discounted_amount,tax,total",
      [
        order.country,
        order.customer_type,
        format("%.2f", order.subtotal),
        format("%.2f", discounted_amount),
        format("%.2f", tax),
        format("%.2f", total)
      ].join(",")
    ].join("\n")
  end
end

class Checkout
  def initialize(discount_policy:, tax_policy:, receipt_renderer:)
    @discount_policy = discount_policy
    @tax_policy = tax_policy
    @receipt_renderer = receipt_renderer
  end

  def receipt_for(order)
    discounted_amount = @discount_policy.apply(order)
    tax = @tax_policy.calculate(discounted_amount)

    @receipt_renderer.render(order, discounted_amount, tax)
  end
end

orders = [
  Order.new(subtotal: 120, customer_type: "regular", country: "HK"),
  Order.new(subtotal: 120, customer_type: "vip", country: "US"),
  Order.new(subtotal: 120, customer_type: "regular", country: "EU")
]

checkouts = [
  Checkout.new(
    discount_policy: NoDiscount.new,
    tax_policy: NoTax.new,
    receipt_renderer: TextReceipt.new
  ),
  Checkout.new(
    discount_policy: VipDiscount.new,
    tax_policy: UsTax.new,
    receipt_renderer: TextReceipt.new
  ),
  Checkout.new(
    discount_policy: FlashSaleDiscount.new,
    tax_policy: EuTax.new,
    receipt_renderer: CsvReceipt.new
  )
]

checkouts.zip(orders).each do |checkout, order|
  puts checkout.receipt_for(order)
  puts "---"
end
