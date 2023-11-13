require 'rspec'
require_relative '../src/nameable'

class ConcreteNameable < Nameable
  def correct_name
    'John Doe'
  end
end

describe Nameable do
  let(:nameable) { ConcreteNameable.new }

  it 'should raise NotImplementedError for correct_name' do
    expect { subject.correct_name }.to raise_error(NotImplementedError)
  end

  it 'should allow correct_name to be implemented in a subclass' do
    expect(nameable.correct_name).to eq('John Doe')
  end
end
