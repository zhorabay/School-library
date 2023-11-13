require 'rspec'
require_relative '../src/teacher'
require_relative '../src/person'

describe Teacher do
  let(:specialization) { 'ICT' }
  let(:age) { 35 }
  let(:name) { 'Mr. Ye Min Thu' }
  let(:parent_permission) { true }
  let(:teacher) { Teacher.new(specialization, age, name, parent_permission: parent_permission) }

  it 'should have a specialization' do
    expect(teacher.specialization).to eq(specialization)
  end

  it 'should have an age' do
    expect(teacher.age).to eq(age)
  end

  it 'should have a name' do
    expect(teacher.name).to eq(name)
  end

  it 'should have parent permission' do
    expect(teacher.can_use_services?).to be_truthy
  end
end