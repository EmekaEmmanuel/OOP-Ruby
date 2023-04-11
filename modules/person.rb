# top level comment for linter error
class Person
  attr_accessor :id, :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def to_get_id
    id
  end

  def to_get_name
    @name
  end

  def to_get_age
    @age
  end

  def to_set_name=(name)
    @name = name
  end

  def to_set_age=(age)
    @age = age
  end

  def of_age
    case age
    when age >= 18
      true
    else
      false
    end
  end

  def can_use_services
    return true if of_age? || parent_permission
  end

  private :of_age
end
