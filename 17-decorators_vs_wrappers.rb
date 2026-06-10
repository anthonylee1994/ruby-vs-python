def log_call(method_name)
  original_method = method(method_name)

  define_singleton_method(method_name) do |*args|
    puts "Calling #{method_name}"
    result = original_method.call(*args)
    puts "Finished #{method_name}"

    result
  end
end

def total(items)
  items.sum
end

log_call(:total)

puts total([10, 20, 30])

puts '---'

class Retry
  def initialize(attempts:)
    @attempts = attempts
  end

  def run
    last_error = nil

    (1..@attempts).each do |attempt|
      return yield
    rescue RuntimeError => e
      last_error = e
      puts "Attempt #{attempt} failed"
    end

    raise last_error
  end
end

counter = { count: 0 }

sometimes_fails = lambda do
  counter[:count] += 1

  raise 'Not ready' if counter[:count] < 2

  'OK'
end

puts Retry.new(attempts: 3).run(&sometimes_fails)
