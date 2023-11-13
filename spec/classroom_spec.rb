require 'rspec'
require_relative '../src/classroom'

class MockStudent
  attr_accessor :name, :classroom

  def initialize(name)
    @name = name
  end
end

describe Classroom do
  let(:classroom_label) { 'Math101' }
  let(:student1) { MockStudent.new('Alice') }
  let(:student2) { MockStudent.new('Bob') }

  subject { described_class.new(classroom_label) }

  describe '#initialize' do
    it 'sets the label and initializes students as an empty array' do
      expect(subject.label).to eq(classroom_label)
      expect(subject.students).to be_an_instance_of(Array)
      expect(subject.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the students array' do
      subject.add_student(student1)
      expect(subject.students).to include(student1)
    end

    it 'associates the student with the classroom' do
      expect { subject.add_student(student1) }.to change { student1.classroom }.from(nil).to(subject)
    end
  end
end
