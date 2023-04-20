require_relative 'person'

# top level comment on Teacher Class for linter error
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name: 'Unknown', id: rand(1...1000), parent_permission: true)
    @specialization = specialization
    super(age, name, id, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end
end
