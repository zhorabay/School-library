require 'rspec'
require_relative '../src/book'
require_relative '../src/rental'

describe Book do
  let(:title) { 'The Great Gatsby' }
  let(:author) { 'F. Scott Fitzgerald' }
  let(:book) { Book.new(title, author) }
  let(:rental_date) { '2023-11-15' }
  let(:person) { Person.new(25, 'John Doe') }
  let(:rental) { Rental.new(rental_date, book, person) }

  it 'should have a title' do
    expect(book.title).to eq(title)
  end

  it 'should have an author' do
    expect(book.author).to eq(author)
  end

  it 'should initialize rentals as an empty array' do
    expect(book.rentals).to be_an(Array)
    expect(book.rentals).to be_empty
  end

  it 'should add a rental to the rentals array' do
    book.add_rental(rental)
    expect(book.rentals).to include(rental)
  end
end
