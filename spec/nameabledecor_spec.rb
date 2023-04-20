require_relative '../modules/student'
require_relative '../modules/nameabledecor'

describe Decorator do
  context 'when the string is not empty' do
    it 'Should return the same name' do
      person = Person.new(19, name: 'jhon')
      subject = NameableDecor.new(person)

      expect(subject.correct_name).to eq('jhon')
    end
  end
end