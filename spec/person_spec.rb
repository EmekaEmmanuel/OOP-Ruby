require_relative '../modules/person'
require_relative '../modules/book'
require_relative '../modules/rental'

describe Person do
  context 'When creating a new person' do
    it 'should create a new person with a name and age' do
      person = Person.new(20, name = 'Tuchel')
      expect(person.name).to eq('Tuchel')
      expect(person.age).to eq(20)
    end
  end

  context 'When creating a new person with no name' do
    it 'should create a new person with a default name' do
      person = Person.new(20)
      expect(person.name).to eq('Unknown')
      expect(person.age).to eq(20)
    end
  end

  context 'When calling methods with a properly created person' do
    it 'should return true if the person is of age or if has permission' do
      person = Person.new(20)
      expect(person.can_use_services?).to be true
    end

    it 'should return false if the person is not of age and does not have permission' do
      person = Person.new(16, parent_permission: false)
      expect(person.can_use_services?).to be false
    end

    it 'should return the correct name' do
      person = Person.new(20, name = 'Tuchel')
      expect(person.correct_name).to eq('Tuchel')
    end

    it "should add a rental to the person's rentals" do
      person = Person.new(20)
      book = Book.new('The Hobbit', 'J.R.R. Tolkien')
      rental = Rental.new('2020-01-01', book, person)
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end
  end

  context 'When calling private methods inside the class' do
    it 'should return true if the person is of age' do
      person = Person.new(20)
      expect(person.send(:of_age?)).to be true
    end

    it 'should return false if the person is not of age' do
      person = Person.new(16)
      expect(person.send(:of_age?)).to be false
    end
  end
end
