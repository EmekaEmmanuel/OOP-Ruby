require 'json'
require_relative '../modules/rental'
require_relative '../modules/book'
require_relative '../modules/person'

describe Rental do
  book = Book.new('The Hobbit', 'J.R.R. Tolkien')
  person = Person.new(18, name = 'John Doe', id = 20, parent_permission: true)

  it 'rental should initalize successfully' do
    rental = Rental.new('2020-07-24', book, person)
    expect(rental).to be_a(Rental)
  end

  rental = nil

  before :each do
    rental = Rental.new('2020-07-24', book, person)
  end
end
