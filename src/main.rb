require 'app'

class Main
  def initialize
    @app = App.new
  end

  def main
    puts 'Welcome to School Library App'
    loop do
      puts '\nPlease, choose an option by entering a number'
      puts '1. List all books'
      puts '2. List all people'
      puts '3. Create a person'
      puts '4. Create a book'
      puts '5. Create a rental'
      puts '6. List all rentals for a given person id'
      puts '7. Exit'

      choice = gets.chomp.to_i

      case choice
      when 1
        @app.list_all_books
      when 2
        @app.list_all_people
      when 3
        puts 'Do you want to create a student (1) or a teacher (2)?'
        role_choice = gets.chomp.to_i

        case role_choice
        when 1
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
        when 2
          puts 'Age:'
          age = gets.chomp.to_i
          puts 'Name:'
          name = gets.chomp
          puts 'Specialization:'
          specialization = gets.chomp
          @app.create_person(name, age, 'teacher')
          puts 'Person created successfully'
        else
          puts 'Invalid role choice. Please try again.'
        end
      when 4
        puts 'Title:'
        title = gets.chomp
        puts 'Author:'
        author = gets.chomp
        @app.create_book(title, author)
        puts 'Book created successfully'
      when 5
        puts 'Select a book from the following list by number'
        book_id = gets.chomp.to_i
        puts 'Select a person from the following list by number (not ID)'
        person_id = gets.chomp.to_i
        puts 'Date:'
        date = gets.chomp
        @app.create_rental(person_id, book_id, date)
        puts 'Rental created successfully'
      when 6
        puts 'ID of person:'
        person_id = gets.chomp.to_i
        puts 'Rentals:'
        @app.list_rentals_for_person(person_id)
      when 7
        puts 'Thank you for using this app!'
        break
      else
        puts 'Invalid option. Please try again.'
      end
    end
  end
end

main_app = Main.new
main_app.main
