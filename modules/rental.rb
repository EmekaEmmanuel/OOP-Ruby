class Rental
  attr_accessor :date, :book, :person

  # attr_reader

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def book=(book)
    @book = book
    return unless book

    book.rentals.push(self)
  end

  def person=(person)
    @person = person
    return unless person

    person.rentals.push(self)
  end
end
