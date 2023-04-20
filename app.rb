require 'json'
require './LocalStore/database'
require './LocalStore/database_read'
require_relative 'modules/book'
require_relative 'modules/person'
require_relative 'modules/rental'
require_relative 'modules/student'
require_relative 'modules/teacher'


class App
  include WriteToDatabase
  include ReadFromDatabase

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def display_books(show_index: false)
    @books = read_books
    if @books.empty?
      puts 'Booklist is empty: Create a book'
    elsif show_index
      @books.each_with_index { |book, index| puts "#{index})  Title: #{book.title}, Author: #{book.author}" }
      # @books.each_with_index { |book, index| puts "#{index})  Title: #{book.title}, Author: #{book.author}" }
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def display_people(show_index: false)
    @people = read_people
    if @people.empty?
      puts 'People list is empty: Create a person'
    elsif show_index
      @people.each_with_index do |person, index|
        puts "#{index}) #{person.class} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        puts 'Create person successfully'
      end
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
      puts 'Create person successfully'
    end
  end

  def dispaly_rentals(person_id)
    puts "Entering block"
    @rentals = read_rentals
    if @rentals.empty?
      puts 'Rental list is empty: Create a Rental'
    else
      @rentals.each do |rental| 
        if rental.person.id == person_id 
          puts "On the #{rental.date}, this Book; #{rental.book.title} was collected by #{rental.person.name}"
        end
      end
    end
  end

  def create_book(title, author)
    new_book = Book.new(title, author)
    puts new_book
    @books.push({
      "title": "#{new_book.title}",
      "author": "#{new_book.author}"
    })
    write_books(@books)
    puts 'Books created successfully!.'
  end

  def create_person(name, age, classroom, type, parent_permission: true, specialization: '')
    case type
    when 'student'
      new_student = Student.new(age, classroom, name)
      puts new_student
      @people.push(new_student)
  
      new_vari = @people.map do |person|
        {
              name: person.name,
             age: person.age,
              id: person.id,
              class: person.class.name
        }
      end
      write_people(new_vari)

    when 'teacher'
      new_teacher = Teacher.new(age,specialization, name)
      @people.push(new_teacher)
      new_variabl = @people.map do |person|
        {
        name: person.name,
        type: person.class,
        age: person.age,
        specialization: person.specialization,
        id: person.id
      }
    end
      write_people(new_variabl)
    else
      puts 'Invalid People Type'
    end
    puts 'Create person successfully'
  end

  def create_rental(date, book_index, people_index) 
    # puts "just came out of block"
    new_rental = Rental.new(date,@books[book_index], @people[people_index])
    @rentals.push(new_rental)
    # puts new_rental
    new_vari = @rentals.map do |new_rent|
     
      { date: new_rent.date, 
        person: { age: new_rent.person.age, name: new_rent.person.name, id: new_rent.person.id },
        title: { title: new_rent.book.title, author: new_rent.book.author }
      }
    end
  
    write_rentals(new_vari)
    puts 'Rental created successfully'
  end

end
