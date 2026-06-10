class User
  attr_reader :name, :role

  def initialize(name, role)
    @name = name
    @role = role
  end

  def admin?
    role == "admin"
  end
end

user = User.new("Ada", "admin")

puts user.name
puts user.role
puts user.admin?
