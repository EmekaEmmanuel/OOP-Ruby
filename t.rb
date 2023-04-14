require_relative 'app'

def main
  new_app = App.new
  initiator(new_app)
end

def initiator(new_app)
  puts "Welcome to school library app \n"
  puts 'Please choose an option by entering a number: '
  puts '1 - List all books'
  puts '2 - List all people '
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts "7 - Exit \n"

  intro_num_select = gets.chomp.to_i
  selected_intro(intro_num_select, new_app)
end

def selected_intro(intro_num_select, new_app)
  case intro_num_select
  when 1
    selected_list_books(new_app)
    initiator(new_app)
  when 2
    selected_list_people(new_app)
    initiator(new_app)
  when 3
    puts 'Create a person'
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]:'
    person_type_value = gets.chomp.to_i
    selected_person_intro(person_type_value, new_app)
  when 4
    validate_book_intro(new_app)
  when 5
    puts 'Create a rental'
    validate_rental(new_app)
  when 6
    selected_rental_intro(new_app)
  when 7
    puts 'Thanks for using the app.'
  else
    puts 'Invalid input. Kindly retry'
    initiator(new_app)
  end
end

# LIST ALL BOOKS
def selected_list_books(new_app)
  # puts "Book list: "
  new_app.display_books
end

# LIST ALL PEOPLE
def selected_list_people(new_app)
  # puts "People list: "
  new_app.display_people
end

# CREATE A PERSON
#  1 = STUDENT CHOOSEN; 2 = TEACHER CHOOSEN
def selected_person_intro(person_type_value, new_app)
  # puts new_app
  # puts person_type_value
  case person_type_value
  when 1
    puts 'Age:  '
    age_value = gets.chomp
    puts 'Name:  '
    name_value = gets.chomp
    puts 'Has parent permission? [Y/N]:  '
    parent_permission_value = gets.chomp.upcase
    puts 'Classroom:  '
    classroom_value = gets.chomp
    validate_person_student(age_value, classroom_value, name_value, parent_permission_value, new_app)
  when 2
    puts 'Age:  '
    age_value = gets.chomp
    puts 'Name:  '
    name_value = gets.chomp
    puts 'Specialization:  '
    specialization_value = gets.chomp.upcase

    validate_person_teacher(age_value, name_value, specialization_value, new_app)
  else
    puts 'Invalid Input'
    initiator(new_app)
  end
end

# VALIDATE STUDENT BEFORE CREATION
def validate_person_student(age_value, classroom_value, name_value, parent_permission_value, new_app)
  if parent_permission_value == 'Y'
    new_app.create_person(name_value, age_value, classroom_value, type = 'student', parent_permission: true)
  elsif parent_permission_value == 'N'
    new_app.create_person(name_value, age_value, classroom_value, type = 'student', parent_permission: false)
  end
  initiator(new_app)
end

# VALIDATE TEACHER BEFORE CREATION
def validate_person_teacher(age_value, name_value, specialization_value, new_app)
  new_app.create_person(name_value, age_value, classroom = '', type = 'teacher', specialization: specialization_value)
  initiator(new_app)
end

#  CREATE A BOOK
def validate_book_intro(new_app)
  puts 'CREATE A BOOK : ENTER BOOK DETAILS'
  puts 'Title:  '
  title = gets.chomp
  puts 'Author:  '
  author = gets.chomp
  new_app.create_book(author, title)
  initiator(new_app)
end

#  CREATE A RENTAL
# VALIDATE A RENTAL
def validate_rental(new_app)
  puts 'Select a book from the following list by number'
  new_app.display_books(show_index: true)
  rental_book_selected = gets.chomp.to_i
  puts 'Select a person from the following list by number (not ID please)'
  new_app.display_people(show_index: true)
  rental_person_selected = gets.chomp.to_i
  puts 'Date: (YYYY-MM-DD)'
  rental_date_selected = gets.chomp
  rental_creation(new_app, rental_book_selected, rental_person_selected, rental_date_selected)
end

# ACTUAL RENTAL CREATION
def rental_creation(new_app, rental_book_selected, rental_person_selected, rental_date_selected)
  new_app.create_rental(rental_date_selected, rental_book_selected, rental_person_selected)
  # puts 'Rental created successfully'
  initiator(new_app)
end

# LIST RENTALS
def selected_rental_intro(new_app)
  puts 'ID of person: '
  person_rental_id = gets.chomp.to_i
  new_app.dispaly_rentals(person_rental_id)
  initiator(new_app)
end
main
