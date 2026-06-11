# Ruby 用 attr_reader 暴露只讀屬性，instance variable 會用 @ 開頭。
class User
  attr_reader :name, :role

  def initialize(name, role)
    @name = name
    @role = role
  end

  def admin?
    role == 'admin'
  end
end

user = User.new('Ada', 'admin')

puts user.name
puts user.role
puts user.admin?
