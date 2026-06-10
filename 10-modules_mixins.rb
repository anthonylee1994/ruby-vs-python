module Timestampable
  def timestamp
    '2026-06-10T12:00:00Z'
  end
end

module JsonSerializable
  def to_json_hash
    instance_variables.to_h do |variable_name|
      [variable_name.to_s.delete_prefix('@'), instance_variable_get(variable_name)]
    end
  end
end

class AuditEvent
  include Timestampable
  include JsonSerializable

  def initialize(action, user)
    @action = action
    @user = user
  end

  def summary
    "#{@user} did #{@action} at #{timestamp}"
  end
end

event = AuditEvent.new('login', 'Ada')

puts event.summary
p event.to_json_hash

puts '---'

class AdminAuditEvent < AuditEvent
  def summary
    "[ADMIN] #{super}"
  end
end

admin_event = AdminAuditEvent.new('delete-user', 'Grace')

puts admin_event.summary
