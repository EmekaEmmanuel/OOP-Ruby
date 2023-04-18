require 'json'

module WriteToDatabase
  def write_people(person)
    File.write('./MockFiles/person.json', JSON.pretty_generate(person))
  end

  def write_books(book)
    File.write('./MockFiles/book.json', JSON.pretty_generate(book))
  end

  def write_rentals(rental)
    File.write('./MockFiles/rental.json', JSON.pretty_generate(rental))
  end
end
