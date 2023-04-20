require_relative '../modules/book'
require_relative '../modules/person'
require_relative '../modules/rental'

describe Book do
  context 'when initialized' do
    book = Book.new('The Hobbit', 'J.R.R. Tolkien')
    it 'has a title' do
      expect(book.title).to eq('The Hobbit')
    end

    it 'has an author' do
      expect(book.author).to eq('J.R.R. Tolkien')
    end
  end

  context 'when adding rentals' do
    book = Book.new('The Hobbit', 'J.R.R. Tolkien')
    person = Person.new(19, name = 'Jhon')
    rental = Rental.new('2020-01-01', book, person)
    book.add_rental(rental)
    it 'has rentals' do
      expect(book.rentals).not_to be_empty
    end

    it 'has the correct rental' do
      expect(book.rentals[0]).to eq(rental)
    end
  end
end
