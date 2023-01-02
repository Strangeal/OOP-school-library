require_relative 'options'
require_relative 'menu'

class Prompt
  def prompt(app)
    LibraryMenu.new.library_menu

    user_input = gets.chomp.to_i
    user_input == 7 ? app.exit_app : Options.new.options(user_input, app)
    prompt(app)
  end
end
