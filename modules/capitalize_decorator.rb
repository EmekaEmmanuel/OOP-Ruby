require_relative 'nameabledecor'

class CapitalizeDecorator < NameableDecor
  def correct_name
    super.capitalize
  end
  # Implement a method correct_name that capitalizes the output of @nameable.correct_name.
end
