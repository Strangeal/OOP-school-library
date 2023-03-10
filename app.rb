require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'prompt'
require_relative 'read'
require_relative 'save'

class App
  attr_accessor :book, :people, :rentals

  def initialize
    @book = Read.new.read_books
    @people = Read.new.read_person
    @rentals = Read.new.read_rentals
  end

  def exit_app
    Save.new.save_books(@book)
    Save.new.save_people(@people)
    Save.new.save_rentals(@rentals)
    puts 'Thanks for using the app! 🤗🥰'
    exit
  end

  # Default return
  def back_to_menu
    print "\n Press Any key to go back to menu: "
    gets.chomp
  end

  # list books
  def list_books
    if @book.empty?
      puts "\n No book available 😔"
      back_to_menu
    end
    puts 'List of all books: '
    @book.each_with_index do |list, i|
      puts "#{i}) Title: #{list.title}, Author: #{list.author}"
    end
    back_to_menu
  end

  # list people
  def list_people
    if @people.empty?
      puts "\n No people available 😔"
      back_to_menu
    end
    puts 'List of all people: '
    @people.each_with_index do |list, i|
      puts "#{i}) [#{list.type}] - Name: #{list.name}, ID: #{list.id} Age: #{list.age}"
    end
    back_to_menu
  end

  # create person
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2) [Input the number]'
    option = gets.chomp.to_i

    case option
    when 1 then create_student
    when 2 then create_teacher
    else
      puts 'Please enter a number (1 or 2)'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Classroom (A-4, B-3): '
    classroom = gets.chomp.upcase
    parent_permission = permission?
    new_student = Student.new(classroom, age, name, parent_permission: parent_permission)
    @people.push(new_student)
    puts 'Person created successfully 🧑🏼‍🎓👍'
    back_to_menu
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'specialization: '
    specialization = gets.chomp
    new_teacher = Teacher.new(age, specialization, name)
    @people.push(new_teacher)
    puts 'Teacher created successfully 👩🏼‍🏫👍'
    back_to_menu
  end

  def permission?
    print 'Has parents permission? [Y/N]: '
    permission = gets.chomp.upcase

    case permission
    when 'N' then false
    when 'Y' then true
    else
      puts 'Incorrect input'
      permission?
    end
  end

  # Create a book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @book.push(new_book)
    puts "\n Book created 📚"
    back_to_menu
  end

  # create rentals
  def create_rental
    puts 'Select a book 📚 from the following by number '
    @book.each_with_index { |list, i| puts "#{i}) Title: #{list.title}, Author: #{list.author}" }
    Prompt.new.prompt(self) if @book.empty?
    index = gets.chomp.to_i
    book = @book[index]

    puts 'Select a person 👭 from the following list by number (not id)'
    @people.each_with_index { |list, i| puts "#{i}) Name: #{list.name}, ID: #{list.id} Age: #{list.age}" }
    Prompt.new.prompt(self) if @people.empty?
    index = gets.chomp.to_i
    person = @people[index]

    print '📆 Date(yyyy/mm/dd): '
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals.push(rental)
    puts "\n Rental created successfully 📚⚖️"
    back_to_menu
  end

  # get all rentals
  def list_rentals
    if @rentals.empty?
      puts "\n No rental mode"
    else
      # get detals of rentals by id
      print 'Person id: '
      person_id = gets.chomp.to_i
      person_rentals = @rentals.select { |rental| rental.person.id == person_id }
      if person_rentals.empty?
        puts "\n ❌ Person ID not found ❌"
      else
        person_rentals.each do |list|
          puts "Date: #{list.date}, Books: #{list.book.title} written by Author: #{list.book.author}"
        end
      end
    end
  end
end
