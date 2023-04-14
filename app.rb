# List all books.
# List all people.
# Create a person (teacher or student, not a plain Person).
# Create a book.
# Create a rental.
# List all rentals for a given person id.
require_relative 'modules/book'
require_relative 'modules/person'
require_relative 'modules/rental'
require_relative 'modules/student'
require_relative 'modules/teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def display_books(show_index: false)
    if @books.empty?
      puts 'Booklist is empty: Create a book'
    elsif show_index
      @books.each_with_index { |book, index| puts "#{index})  Title: #{book.title}, Author: #{book.author}" }
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def display_people(show_index: false)
    if @people.empty?
      puts 'People list is empty: Create a person'
    elsif show_index
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        puts 'Create person successfully'
      end
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
      puts 'Create person successfully'
    end
  end

  def dispaly_rentals(person_id)
    if @rentals.empty?
      puts 'Rental list is empty: Create a Rental'
    else
      puts 'Rentals:'
      @rentals.each do |rental|
        if rental.person.id == person_id
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        end
      end
    end
  end

  def create_book(title, author)
    @books.push(Book.new(title, author))
    puts 'Books created successfully!.'
  end

  def create_person(name, age, classroom, type, parent_permission: true, specialization: '')
    case type
    when 'student'
      @people.push(Student.new(age, classroom, name: name, parent_permission: parent_permission))
    when 'teacher'
      @people.push(Teacher.new(age, specialization, name: name, parent_permission: parent_permission))
    else
      puts 'Invalid People Type'
    end
    puts 'Create person successfully'
  end

  def create_rental(date, book_index, people_index)
    puts date
    puts book_index
    puts people_index
    @rentals.push(Rental.new(date=date, book= @books[book_index], person= @people[people_index]))
    puts 'Rental created successfully'
  end
end
