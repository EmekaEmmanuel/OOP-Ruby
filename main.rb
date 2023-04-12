require_relative 'modules/person'
require_relative 'modules/capitalize_decorator'
require_relative 'modules/trimmer_decorator'

puts person = Person.new(22, 'maximilianus')
puts person.correct_name
puts capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
puts capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
