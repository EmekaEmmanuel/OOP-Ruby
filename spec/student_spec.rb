require_relative '../modules/student'
require_relative '../modules/classroom'


describe Student do
  it 'student should initalize successfully' do
    student = Student.new(18, 1, name: 'John Doe')
    expect(student.name).to eq('John Doe')
  end

  it '[play_hooky] method should return a string' do
    student = Student.new(18, name = 'John Doe')
    expect(student.play_hooky).to be_a(String)
  end

  it '[classroom] setter should add student to classroom' do
    student = Student.new(18, name = 'John Doe')
    classroom = Classroom.new('Math')

    student.classroom = classroom

    expect(classroom.students).to include(student)
  end
end
