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

  def create_person(age, name, type)
    if type == 'student'
      person = Student.new(age, name)
      @people.push(person)
    elsif type == 'teacher'
      person = Teacher.new(age, name)
      @people.push(person)
    end
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
  end

  def create_rental(person_id, book_id, date)
    person = @people.find { |p| p.id == person_id }
    book = @books.find { |b| b.id == book_id }
    date = gets.chomp

    if person.nil? || book.nil?
      puts 'Person or book not found.'
      return
    end

    rental = Rental.new(date, book, person)
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts 'Person not found.'
      return
    end

    rentals = @rentals.select { |r| r.person == person }
    puts "Rentals: #{person.name}:"
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author},"
    end
  end
end
