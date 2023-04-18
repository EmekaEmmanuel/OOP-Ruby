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
    @books = read_books
    @people = read_people
    @rentals = read_rentals
  end

  def display_books(show_index: false)
    if @books.empty?
      puts 'Booklist is empty: Create a book'
    elsif show_index
      @books.each_with_index { |book, index| puts "#{index})  Title: #{book['title']}, Author: #{book['author']}" }
      # @books.each_with_index { |book, index| puts "#{index})  Title: #{book.title}, Author: #{book.author}" }
    else
      @books.each { |book| puts "Title: #{book['title']}, Author: #{book['author']}" }
    end
  end

  def display_people(show_index: false)
    if @people.empty?
      puts 'People list is empty: Create a person'
    elsif show_index
      @people.each_with_index do |person, index|
        puts "#{index}) #{person['type']} Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
        puts 'Create person successfully'
      end
    else
      @people.each { |person| puts "#{person.class} Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}" }
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

  # def dispaly_rentals(person_id)
  #   if @rentals.empty?
  #     puts 'Rental list is empty: Create a Rental'
  #   else
  #     puts 'Rentals:'
  #     @rentals.each do |rental|
  #       if rental.person.id == person_id
  #         puts "Date: #{rental['date']}, Book: #{rental['book'].title} by #{rental.book['author']}"
  #       end
  #     end
  #   end
  # end

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
      new_student = Student.new(age, classroom, name: name, parent_permission: parent_permission)
      puts new_student
      @people.push({
          "name": "#{new_student.name}",
          "type": "#{new_student.class}",
          "age": "#{new_student.age}",
          "classroom": "#{new_student.classroom}",
          "id": "#{new_student.id}"
      })
      write_people(@people)
    when 'teacher'
      new_teacher = Teacher.new(age, specialization, name: name, parent_permission: parent_permission)
      @people.push({
        "name": "#{new_teacher.name}",
        "type": "#{new_teacher.class}",
        "age": "#{new_teacher.age}",
        "specialization": "#{new_teacher.specialization}",
        "id": "#{new_teacher.id}"
      })
      write_people(@people)
    else
      puts 'Invalid People Type'
    end
    puts 'Create person successfully'
  end

  def create_rental(date, book_index, people_index)
    new_rental = Rental.new(date = date, book = @books[book_index], person = @people[people_index])
    @rentals.push({
      "date": "#{new_rental.date}", 
      # "index": "#{new_rental.person['id']}",
      "person": "#{new_rental.person}",
      "title": "#{new_rental.book}"
    })
    write_rental(@rentals)
    puts 'Rental created successfully'
  end
end
