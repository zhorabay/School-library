require 'rspec'
require_relative '../src/trimmer'

describe TrimmerDecorator do
  let(:short_name) { 'John' }
  let(:long_name) { 'ThisIsALongName' }
  let(:nameable_short) { double('Nameable', correct_name: short_name) }
  let(:nameable_long) { double('Nameable', correct_name: long_name) }

  context 'when the name is short' do
    let(:decorator_short) { TrimmerDecorator.new(nameable_short) }

    it 'should wrap a Nameable object' do
      expect(decorator_short.nameable).to eq(nameable_short)
    end

    it 'should return the short correct name' do
      expect(decorator_short.correct_name).to eq(short_name)
    end
  end

  context 'when the name is long' do
    let(:decorator_long) { TrimmerDecorator.new(nameable_long) }

    it 'should wrap a Nameable object' do
      expect(decorator_long.nameable).to eq(nameable_long)
    end

    it 'should return a truncated correct name' do
      expect(decorator_long.correct_name).to eq('ThisIsALon')
    end
  end
end