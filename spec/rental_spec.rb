require 'rspec'
require_relative '../src/rental'
require_relative '../src/book'
require_relative '../src/person'

describe Rental do
  let(:book_title) { 'The Great Gatsby' }
  let(:book_author) { 'F. Scott Fitzgerald' }
  let(:book) { Book.new(book_title, book_author) }
  let(:person) { Person.new(25, 'John Doe') }
  let(:rental_date) { '2023-11-15' }
  let(:rental) { Rental.new(rental_date, book, person) }

  it 'should have a date' do
    expect(rental.date).to eq(rental_date)
  end

  it 'should be associated with a book' do
    expect(rental.book).to eq(book)
  end

  it 'should be associated with a person' do
    expect(rental.person).to eq(person)
  end
end
