require './app'

class Main
  def initialize
    @app = App.new
  end

  def main
    puts 'Welcome to School Library App'
    loop do
      display_menu
      choice = gets.chomp.to_i
      handle_choice(choice)
    end
  end

  def handle_choice(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_for_person
    when 7
      exit_app
    else
      puts 'Invalid option. Please try again.'
    end
  end

  def display_menu
    puts 'Please, choose an option by entering a number'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Exit'
  end

  def list_books
    @app.list_all_books
  end

  def list_people
    @app.list_all_people
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'
    role_choice = gets.chomp.to_i
    case role_choice
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid role choice. Please try again.'
    end
  end

  def create_student
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts 'Has a parent permission? [Yes/No]'
    parent_permission_q = gets.chomp
    case parent_permission_q
    when 'Yes'
      @app.create_person(name, age, 'student')
      puts 'Person created successfully'
    when 'No'
      puts 'Student cannot rent a book'
    else
      puts 'Invalid parent permission choice. Please try again.'
    end
  end

  def create_teacher
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    @app.create_person(name, age, 'teacher')
    puts 'Person created successfully'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    @app.create_book(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @app.list_all_books
    book_id = gets.chomp.to_i
    puts 'Select a person from the following list by number (not ID)'
    @app.list_all_people
    person_id = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp
    @app.create_rental(person_id, book_id, date)
    puts 'Rental created successfully'
  end

  def list_rentals_for_person
    puts 'ID of person:'
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    @app.list_rentals_for_person(person_id)
  end

  def exit_app
    puts 'Thank you for using this app!'
    exit
  end
end

main_app = Main.new
main_app.main
