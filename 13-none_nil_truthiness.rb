# Ruby 入面只有 nil 同 false 係 falsy，0、空字串同空 array 都係 truthy。
values = [nil, false, true, 0, 1, '', 'hello', [], [1]]

values.each do |value|
  if value
    puts "#{value.inspect} is truthy"
  else
    puts "#{value.inspect} is falsy"
  end
end

puts '---'

# 用 || 做 fallback 時，空字串喺 Ruby 仍然會保留。
def display_name(user)
  name = user[:name]

  name || 'Guest'
end

puts display_name({ name: 'Ada' })
puts display_name({ name: '' })
puts display_name({})
