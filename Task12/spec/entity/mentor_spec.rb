require_relative '../../entity/mentor'
require_relative '../../repository/school_repository'
require_relative '../../entity/student'
require_relative '../../entity/homework'
require 'pry'
require 'pry-byebug'

RSpec.describe Mentor do # rubocop:disable Metrics/BlockLength
  let(:school_repository) { SchoolRepository.new }
  let(:mentor) { Mentor.new(school_repository: school_repository) }
  let(:student) { Student.new(school_repository: school_repository) }
  let(:homework) { Homework.new(student_id: 1, mentor_id: 2, title: 'Ruby') }

  describe '.new' do
    it 'init with school_repisitory' do
      expect(mentor.school_repository).to eq(school_repository)
    end
  end

  describe '#attach' do
    it 'adds a student to the subscription list' do
      mentor.attach(student)
      expect(mentor.students_subs).to include(student)
    end
  end

  describe '#detach' do
    it 'delete a student from the subscription list' do
      mentor.attach(student)
      mentor.detach(student)
      expect(mentor.students_subs).not_to include(student)
    end
  end

  describe '#update' do
    it 'recive notification from student, get added to the list' do
      mentor.update(student)
      expect(mentor.students_to_check).to include(student)
    end
  end

  describe '#notify' do
    it 'notifyes specific student, student saves mentor to homework_to_do' do
      #       binding.pry
      #       student.do_homework(homework)
      #       student.submit_homework(homework, mentor.id)
      #       mentor.notify(student)
      #       expect(student.homework_to_do).to include(mentor)
      expect(student).to receive(:update).with(mentor) # chatGPT, cool solutions, I like it
      mentor.notify(student)
    end
  end

  describe '#notify_all' do
    it 'notifies all subscribed students' do
      mentor.attach(student)
      expect(student).to receive(:update).with(mentor)
      mentor.notify_all
    end
  end

  # just for now I copypasted all tests down below from chatGPT
  describe '#submit_homework' do
    it 'saves the homework in the school repository and notifies the student' do
      expect(school_repository).to receive(:save).with(homework, student.id, mentor.id)
      expect(student).to receive(:update).with(mentor)
      mentor.submit_homework(homework, student)
    end
  end

  describe '#check_homeworks' do
    before do
      allow(school_repository).to receive(:find).with(student.id, mentor.id).and_return(homework)
      allow(homework).to receive(:content).and_return(5)
      allow(homework).to receive(:grade=)
      allow(homework).to receive(:readiness=)
      mentor.students_to_check << student
    end

    it 'checks homeworks, grades them, and clears the list of students to check' do
      expect(school_repository).to receive(:save).with(homework, student.id, mentor.id)
      mentor.check_homeworks
      expect(mentor.students_to_check).to be_empty
    end
  end
end
