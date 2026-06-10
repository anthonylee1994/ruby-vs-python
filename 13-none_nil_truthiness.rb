values = [nil, false, true, 0, 1, "", "hello", [], [1]]

values.each do |value|
  if value
    puts "#{value.inspect} is truthy"
  else
    puts "#{value.inspect} is falsy"
  end
end

puts "---"

def display_name(user)
  name = user[:name]

  name || "Guest"
end

puts display_name({ name: "Ada" })
puts display_name({ name: "" })
puts display_name({})
