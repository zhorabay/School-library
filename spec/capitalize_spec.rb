require 'rspec'
require_relative '../src/capitalize'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'john doe') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  it 'should wrap a Nameable object' do
    expect(decorator.nameable).to eq(nameable)
  end

  it 'should capitalize the correct name' do
    allow(nameable).to receive(:correct_name).and_return('jane smith')
    expect(decorator.correct_name).to eq('Jane smith')
  end

  it 'should capitalize the correct name regardless of the original capitalization' do
    allow(nameable).to receive(:correct_name).and_return('JoHN DoE')
    expect(decorator.correct_name).to eq('John doe')
  end
end
