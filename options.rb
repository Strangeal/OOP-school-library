require_relative 'app'

# render based on user input
class Options
  def options(user_input, app)
    case user_input
    when 1 then app.list_books
    when 2 then app.list_people
    when 3 then app.create_person
    when 4 then app.create_book
    when 5 then app.create_rental
    when 6 then app.list_rentals
    else
      puts 'Enter a number between 1 - 7'
      puts "\n"
    end
  end
end
