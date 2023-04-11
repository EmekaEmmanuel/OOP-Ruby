require_relative 'person'

# top level comment on Student Class for linter error
class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    @classroom = classroom
    super(name, age, parent_permission)
  end

  def play_hooky
    returns '¯(ツ)/¯'
  end
end
