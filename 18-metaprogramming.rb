class Settings
  def initialize(values)
    @values = values
  end

  def method_missing(name, *)
    return @values[name] if @values.key?(name)

    super
  end

  def respond_to_missing?(name, include_private = false)
    @values.key?(name) || super
  end
end

settings = Settings.new({
  host: "localhost",
  port: 3000
})

puts settings.host
puts settings.port

puts "---"

def add_predicate(class_object, field_name)
  class_object.define_method("has_#{field_name}?") do
    !!public_send(field_name)
  end
end

class User
  attr_reader :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end
end

add_predicate(User, :email)

user = User.new("Ada", "ada@example.com")

puts user.has_email?
