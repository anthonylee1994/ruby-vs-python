def create_user(name, role: "member", active: true)
  {
    name: name,
    role: role,
    active: active
  }
end

p create_user("Ada")
p create_user("Grace", role: "admin")
p create_user("Linus", active: false)

puts "---"

def send_email(to:, subject:, body: "")
  "To: #{to} | Subject: #{subject} | Body: #{body}"
end

puts send_email(to: "ada@example.com", subject: "Welcome")
puts send_email(to: "grace@example.com", subject: "Deploy", body: "Finished")
