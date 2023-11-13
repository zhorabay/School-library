require 'rspec'
require_relative '../src/person'
require_relative '../src/rental'

describe Person do
  let(:age) { 25 }
  let(:name) { 'John Doe' }
  let(:person) { Person.new(age, name) }
  let(:rental_date) { '2023-11-15' }
  let(:book_title) { 'The Great Gatsby' }
  let(:book_author) { 'F. Scott Fitzgerald' }
  let(:book) { Book.new(book_title, book_author) }
  let(:rental) { Rental.new(rental_date, book, person) }

  it 'should have an ID' do
    expect(person.id).to be_an(Integer)
  end

  it 'should have an age' do
    expect(person.age).to eq(age)
  end

  it 'should have a name' do
    expect(person.name).to eq(name)
  end

  it 'should have rentals as an empty array' do
    expect(person.rentals).to be_an(Array)
    expect(person.rentals).to be_empty
  end

  it 'should be able to use services' do
    expect(person.can_use_services?).to be_truthy
  end

  it 'should have a correct name' do
    expect(person.correct_name).to eq(name)
  end

  it 'should add a rental to the rentals array' do
    person.add_rental(rental)
    expect(person.rentals).to include(rental)
  end
end