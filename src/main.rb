require_relative 'app'

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
    when 1 then @app.list_all_books
    when 2 then @app.list_all_people
    when 3 then @app.create_a_person
    when 4 then @app.create_book
    when 5 then @app.rental_selection
    when 6 then @app.list_rentals_for_person
    when 7 then exit_app
    else
      puts 'Invalid option. Please try again.'
    end
  end

  def display_menu
    puts ' '
    puts 'Please, choose an option by entering a number'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Exit'
  end

  def exit_app
    puts 'Thank you for using this app!'
    exit
  end
end

main_app = Main.new
main_app.main
