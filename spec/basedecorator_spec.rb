require 'rspec'
require_relative '../src/basedecorator'

describe Decorator do
  let(:nameable) { double('Nameable', correct_name: 'John Doe') }
  let(:decorator) { Decorator.new(nameable) }

  it 'should wrap a Nameable object' do
    expect(decorator.nameable).to eq(nameable)
  end

  it 'should correct the name' do
    allow(nameable).to receive(:correct_name).and_return('Name Surname')
    expect(decorator.correct_name).to eq('Name Surname')
  end
end
