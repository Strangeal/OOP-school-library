require 'json'

class Read
  def read_books
    books = []
    return books unless File.exist?('./data/books.json')

    file = File.open('./data/books.json')
    parsed = JSON.parse(file.read) # turns into a hash
    parsed.each do |book|
      books.push(Book.new(book['title'], book['author']))
    end
    file.close
    books
  end

  def read_person
    people = []
    return people unless File.exist?('./data/person.json')

    file = File.open('./data/person.json')
    people_data = JSON.parse(file.read)
    people_data.each do |person|
      if person['type'] == 'Teacher'
        teacher = Teacher.new(person['age'], person['specialization'], person['name'])
        teacher.id = person['id']
        people << teacher
      else
        student = Student.new(person['classroom'], person['age'], person['name'])
        student.id = person["id"]
        people << student
      end
    end
    file.close
    people
  end

  def read_rentals
    rentals = []
    return rentals unless File.exist?("./data/rentals.json")

    file = File.open('./data/rentals.json')
    rental_data = JSON.parse(file.read)
    rental_data.each do |rent|
      if rent['type'] == 'Teacher'
        teacher = Teacher.new(rent['age'], rent['specialization'], rent['name'])
        teacher.id = rent['id']
        book = Book.new(rent['title'], rent['author'])
        rental = Rental.new(rent['date'], book, teacher)
      else
        student = Student.new(rent['classroom'], rent['age'], rent['name'])
        student.id = rent['id']
        book = Book.new(rent['title'], rent['author'])
        rental = Rental.new(rent['date'], book, student)
      end
      rentals << rental
    end
    file.close
    rentals
  end
end
