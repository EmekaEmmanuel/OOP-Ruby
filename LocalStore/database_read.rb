require 'json'
require_relative '../modules/book'
require_relative '../modules/teacher'
require_relative '../modules/student'

module ReadFromDatabase
  def read_people
    if File.exist?('./MockFiles/person.json')
      persons = File.open('./MockFiles/person.json')
      data = persons.read
      parsed_people = JSON.parse(data)
      people_arr = parsed_people.map do |dat|
        if dat['type'] == 'Student'
          Student.new(dat['age'], dat['classroom'], name: dat['name'], id: dat['id'])
        else
          Teacher.new(dat['age'], dat['specialzation'], name: dat['name'], id: dat['id'])
        end
      end
    else
      File.write('./MockFiles/person.json', [])
      []
    end
  end

  def read_books
    if File.exist?('./MockFiles/book.json')
      books = File.open('./MockFiles/book.json')
      data = books.read
      parsed_book = JSON.parse(data)
      book_arr = parsed_book.map do |dat|
        Book.new(dat['title'], dat['author'])
      end
    else
      File.write('./MockFiles/book.json', [])
      []
    end
  end

  def read_rentals
    if File.exist?('./MockFiles/rental.json')
      rentals = File.open('./MockFiles/rental.json')
      data = rentals.read
      parsed_data = JSON.parse(data)

      parsed_data.map do |dat|
        if dat['person']['type'] == 'Student'
          Rental.new(dat['date'], Book.new(dat['title']['title'], dat['title']['author']),
                     Student.new(dat['person']['age'], dat['person']['classroon'], name: dat['person']['name'], id: dat['person']['id']))
        else
          Rental.new(dat['date'], Book.new(dat['title']['title'], dat['title']['author']),
                     Teacher.new(dat['person']['age'], dat['person']['specialization'], name: dat['person']['name'], id: dat['person']['id']))
        end
      end

    else
      File.write('./MockFiles/rental.json', [])
      []
    end
  end
end
