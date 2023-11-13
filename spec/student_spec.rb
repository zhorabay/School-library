require 'rspec'
require_relative '../src/student'
require_relative '../src/person'
require_relative '../src/classroom'

describe Student do
  let(:classroom_label) { 'ICT101' }
  let(:classroom) { Classroom.new(classroom_label) }
  let(:age) { 16 }
  let(:name) { 'Assem' }
  let(:parent_permission) { true }
  let(:student) { Student.new(classroom, age, name, parent_permission: parent_permission) }

  it 'should have a classroom' do
    expect(student.classroom).to eq(classroom)
  end

  it 'should add itself to the classroom' do
    expect(classroom.students).to include(student)
  end

  it 'should not add itself to the classroom if already present' do
    student.classroom = classroom
    expect(classroom.students.count(student)).to eq(1)
  end

  it 'should play hooky and return a shrug emoticon' do
    expect(student.play_hooky).to eq('¯\\(ツ)/¯')
  end
end
