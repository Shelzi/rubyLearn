# frozen_string_literal: true

require_relative '../../entity/mentor'
require_relative '../../repository/school_repository'
require_relative '../../entity/student'
require_relative '../../entity/homework'
require 'pry'
require 'pry-byebug'

RSpec.describe SchoolRepository do # rubocop:disable Metrics/BlockLength
  subject(:school_repository) { described_class.new }

  let(:mentor) { Mentor.new(school_repository: school_repository) }
  let(:student) { Student.new(school_repository: school_repository) }
  let(:homework) { Homework.new(student_id: student.id, mentor_id: mentor.id, title: 'Ruby') }

  before do
    mentor.attach(student)
    student.attach(mentor)
  end

  describe '.new' do
    it 'when creating new instance' do
      puts 'test'
      # ? what to test here, class dont have any public vars.
    end
  end

  describe '#save' do
    context 'when trying to save homework in repository with student and mentor id\'s'
    it 'saves homework ' do
      school_repository.save(homework, homework.student_id, homework.mentor_id)
      expect(school_repository.find(student.id, mentor.id)).to eq(homework)
    end
  end

  describe '#find' do
    context 'when trying to find homework in repository with student and mentor id\'s'
    before do
      school_repository.save(homework, homework.student_id, homework.mentor_id)
    end
    it 'returns matching homework' do
      expect(school_repository.find(student.id, mentor.id)).to eq(homework)
    end
  end

  describe '#delete' do
    context 'when trying to delete homework in repository with student and mentor id\'s'
    before do
      school_repository.save(homework, homework.student_id, homework.mentor_id)
    end
    it 'should delete matching homework' do
      school_repository.delete(student.id, mentor.id)
      expect(school_repository.find(student.id, mentor.id)).to eq(nil)
    end
  end
end
