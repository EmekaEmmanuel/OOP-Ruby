require_relative 'nameabledecor'

class TrimmerDecorator < NameableDecor
  def correct_name
    super.length > 10 ? super[0...10] : super
  end
end
