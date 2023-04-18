require 'json'

module ReadFromDatabase
  def read_people
    if File.exist?('./MockFiles/person.json')
      persons = File.open('./MockFiles/person.json')
      data = persons.read
      JSON.parse(data)
    else
      File.write('./MockFiles/person.json', [])
    end
  end

  def read_books
    if File.exist?('./MockFiles/book.json')
      books = File.open('./MockFiles/book.json')
      data = books.read
      JSON.parse(data)
    else
      File.write('./MockFiles/book.json', [])
    end
  end

  def read_rentals
    if File.exist?('./MockFiles/rental.json')
      rentals = File.open('./MockFiles/rental.json')
      data = rentals.read
      JSON.parse(data)
    else
      File.write('./MockFiles/rental.json', [])
    end
  end
end
