require_relative 'person'

# top level comment on Teacher Class for linter error
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    @specialization = specialization
    super(name, age, parent_permission)
  end

  def can_use_services
    true
  end
end
