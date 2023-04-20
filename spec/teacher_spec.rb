require_relative '../modules/teacher'

describe Teacher do
  it 'teacher should initalize successfully' do
    teacher = Teacher.new(30, 'Math', name: 'John', parent_permission: true, id: 1)
    expect(teacher).to be_a(Teacher)
  end

  it '[can_use_services?] should return true' do
    teacher = Teacher.new(30, 'Math', name: 'John', parent_permission: true, id: 1)
    expect(teacher.can_use_services?).to be(true)
  end
end
