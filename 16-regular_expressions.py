# Python 用 re module 做 regex 抽取、替換同 search。
import re


text = "Order #A123 costs $49.99, order #B456 costs $15.00"

order_ids = re.findall(r"#([A-Z]\d+)", text)
prices = re.findall(r"\$(\d+\.\d{2})", text)

print(order_ids)
print(prices)

print("---")

masked = re.sub(r"\$[0-9.]+", "$XX.XX", text)

print(masked)

print("---")

# named group 令 match 結果可以用欄位名攞值。
match = re.search(r"#(?P<order_id>[A-Z]\d+) costs \$(?P<price>\d+\.\d{2})", text)

if match:
    print(match.group("order_id"))
    print(match.group("price"))
