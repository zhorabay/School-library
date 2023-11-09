require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person(type, name, age, parent_permission)
    if type == 'student'
      person = Student.new(age, name, parent_permission)
      @people.push(person)
    elsif type == 'teacher'
      person = Teacher.new(age, name, parent_permission)
      @people.push(person)
    end
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
  end

  def create_rental(person_index, book_index, date)
    person = @people.find { |p| p.id == person_index }
    book = @books.find { |b| b.title == book_index }

    if person && book
      rental = Rental.new(date, book, person)
      @rentals.push(rental)
      puts "Book rented successfully"
    else
      puts "Person or book not found."
    end
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |p| p.id == person_id }

    if person
      puts "Rentals for #{person.name}:"
      @books.each do |book|
        rentals = book.rentals.select { |r| r.include?(person.name) }
        rentals.each { |rental| puts "#{book.title} - #{rental}" }
      end
    else
      puts "Person not found."
    end
  end
end
