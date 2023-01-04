require 'json'
require 'fileutils'

class Save
  def check_file(filename)
    FileUtils.mkdir_p('./data')
    FileUtils.touch('./data/books.json') if !File.exist?('./data/books.json') && filename == 'book'
    FileUtils.touch('./data/person.json') if !File.exist?('./data/person.json') && filename == 'person'
    FileUtils.touch('./data/rentals.json') if !File.exist?('./data/rentals.json') && filename == 'rentals'
  end

  def save_books(books)
    book_arr = []
    books.each do |book|
      book_arr << { title: book.title, author: book.author }
    end
    return if book_arr.empty?
    check_file('book')
    File.write('./data/books.json', JSON.pretty_generate(book_arr))
  end

  def save_people(person)
    person_arr = []
    person.each do |people|
      person_prop = { id: people.id, name: people.name, age: people.age, type: people.type }

      if people.type == 'Student'
        person_prop[:classroom] = people.classroom
        person_prop[:parent_permission] = people.parent_permission
      else
        person_prop[:specialization] = people.specialization
      end
      person_arr << person_prop
    end

    return if person_arr.empty?

    check_file('person')
    File.write('./data/person.json', JSON.pretty_generate(person_arr))
  end

  def save_rentals(rentals)
    rentals_arr = []
    rentals.each do |rental|
      rental_prop = {
        date: rental.date,
        title: rental.book.title, author: rental.book.author,
        id: rental.person.id, name: rental.person.name, age: rental.person.age,
        type: rental.person.type
      }

      if rental.person.type == 'Student'
        rental_prop[:classroom] = rental.person.classroom
      else
        rental_prop[:specialization] = rental.person.specialization
      end
      rentals_arr << rental_prop
    end

    return if rentals_arr.empty?

    check_file('rentals')
    File.write('./data/rentals.json', JSON.pretty_generate(rentals_arr))
  end
end
