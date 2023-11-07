require './person'
require './book'
require './rental'
require './teacher'
require './student'

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

  def create_person(name, age, type)
    if type == 'student'
      puts 'Has a parent permission? [Yes/No]'
      parent_permission_q = gets.chomp.downcase

      if parent_permission_q == 'yes'
        parent_permission = true
        person = Student.new(name, age, parent_permission: parent_permission)
      else
        parent_permission = false
      end

      person = Student.new(name, age, parent_permission: parent_permission)
    elsif type == 'teacher'
      puts 'Specialization:'
      specialization = gets.chomp
      person = Teacher.new(name, age, specialization)
    else
      puts 'Invalid person type.'
      return
    end

    @people.push(person)
    puts 'Person created successfully'
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def create_rental(person_id, book_id, date)
    person = @people.list_all_people { |p| p.id == person_id }
    book = @books.list_all_books { |b| b.id == book_id }

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
