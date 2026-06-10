def fetch_user(user_id)
  sleep 0.1

  { id: user_id, name: "User #{user_id}" }
end

threads = [1, 2, 3].map do |user_id|
  Thread.new do
    fetch_user(user_id)
  end
end

users = threads.map(&:value)

p users

puts "---"

def slow_double(number)
  sleep 0.1

  number * 2
end

worker_threads = [1, 2, 3].map do |number|
  Thread.new do
    slow_double(number)
  end
end

results = worker_threads.map(&:value)

p results
