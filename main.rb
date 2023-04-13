# require_relative 'modules/person'
# require_relative 'modules/capitalize_decorator'
# require_relative 'modules/trimmer_decorator'

# puts person = Person.new(22, 'maximilianus')
# puts person.correct_name
# puts capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
# puts capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name

def main
  puts "Welcome to school library app"
  puts "\n"
  puts "Please choose an option by entering a number:"
  puts "1 - List all books"
  puts "2 - List all people "
  puts "3 - Create a person"
  puts "4 - Create a book"
  puts "5 - Create a rental"
  puts "6 - List all rentals for a given person id"
  puts "7 - Exit" 

  intro_num_select = gets.chomp;
  selected_intro(intro_num_select);
end

def selected_intro(intro_num_select)
    case intro_num_select
    when "1"
        puts "List all books"
    when "2"
        puts "List all people"
    when "3"
        puts "Create a person"
        puts "Do you want to create a student (1) or a teacher (2)? [Input the number]:"
        person_intro_select = gets.chomp();
        selected_person_intro(person_intro_select)
    when "4"
        puts "Create a book"
    when "5"
        puts "Create a rental"
    when "6"
        puts "List all retals for a given person id"
    when "7"
        puts "Exit"
    else
     puts "Invalid input."   
    end
end

def selected_person_intro(person_intro_select)
    case person_intro_select
    when "1"
        puts "Age:  "
        age_value=gets.chomp()
        puts "Name:  "
        name_value=gets.chomp()
        puts "Has parent permission? [Y/N]:  "
        parent_permission_value=gets.chomp()
      
        validate_person_student(age_value,name_value,parent_permission_value)
    when "2"
        puts "Age:  "
        age_value=gets.chomp()
        puts "Name:  "
        name_value=gets.chomp()
        puts "Specialization:  "
        specialization_value=gets.chomp()
      
        validate_person_teacher(age_value,name_value,specialization_value)
    else
        puts "Invalid Input"
        main
    end
end

def validate_person_student(age_value,name_value,parent_permission_value)
    puts ("validate #{age_value}, #{name_value}, #{parent_permission_value} ")
end

main