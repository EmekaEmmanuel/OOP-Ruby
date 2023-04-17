require_relative 'class_refactor'

# INITIALIZE NEW MAIN CLASS
def main
  new_app = NewMain.new
  user_initial_choice(new_app)
end

#  DISPLAY INTERFACE FOR USERS CHOICE
def user_initial_choice(new_app)
  puts new_app.new_main
end

main
