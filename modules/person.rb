require './LocalStore/database_read'
require_relative 'nameable'
# top level comment for linter error
class Person < Nameable
  attr_accessor :age, :name, :rentals, :id

  def initialize(age, name = 'Unknown', id = rand(1...1000), parent_permission: true)
    super()
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = id
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end

  private :of_age?
end
