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

  def rental_selection
    if @books.empty?
      puts 'No book record found'
    elsif @people.empty?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
      book_index = gets.chomp.to_i

      puts 'Select a person from the following list by number (not ID)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      person_index = gets.chomp.to_i

      print 'Date: '
      date = gets.chomp
      create_rental(date, book_index, person_index)
    end
  end

  def create_rental(date, book_index, person_index)
    if book_index >= 0 && book_index < @books.length
      book = @books[book_index]
      person = @people[person_index]
      rental = Rental.new(date, book, person)
      book.add_rental(rental)
      person.add_rental(rental)
      @rentals.push(rental)
      puts 'Rental created successfully.'
    else
      puts 'Invalid book index. Please select a valid book.'
    end
  end

  def list_rentals_for_person(person_id)
    rentals = @rentals.filter { |rental| rental.person.id == person_id }

    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
