# Ruby pattern matching 可以按 hash/array 形狀拆值同加 guard。
def describe_event(event)
  case event
  in { type: 'login', user: user }
    "#{user} logged in"
  in { type: 'purchase', user: user, amount: amount } if amount >= 100
    "#{user} made a large purchase"
  in { type: 'purchase', user: user, amount: amount }
    "#{user} spent $#{amount}"
  else
    'Unknown event'
  end
end

events = [
  { type: 'login', user: 'Ada' },
  { type: 'purchase', user: 'Grace', amount: 120 },
  { type: 'purchase', user: 'Linus', amount: 40 },
  { type: 'logout' }
]

events.each do |event|
  puts describe_event(event)
end

puts '---'

# array pattern 可以攞頭兩個值，再用 *rest 收起剩低嘅元素。
def first_two(values)
  case values
  in [first, second, *rest]
    "#{first}, #{second}, rest=#{rest}"
  else
    'Need at least two values'
  end
end

puts first_two([1, 2, 3, 4])
puts first_two([1])
