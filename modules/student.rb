require_relative 'person'

# top level comment on Student Class for linter error
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name: 'Unknown', id: rand(1...1000), parent_permission: true)
    @classroom = classroom
    super(age, name, id, parent_permission: parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end
