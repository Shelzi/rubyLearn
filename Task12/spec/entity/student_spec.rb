# frozen_string_literal: true

require_relative '../../entity/mentor'
require_relative '../../repository/school_repository'
require_relative '../../entity/student'
require_relative '../../entity/homework'
require 'pry'
require 'pry-byebug'

RSpec.describe Student do # rubocop:disable Metrics/BlockLength
  subject(:student) { described_class.new(school_repository: school_repository) }

  let(:school_repository) { SchoolRepository.new }
  let(:mentor) { Mentor.new(school_repository: school_repository) }

  # I don't know why, but this is default id's of objects all the time
  let(:homework) { Homework.new(student_id: 9, mentor_id: 7, title: 'Ruby') }

  describe '.new' do
    it 'init with school_repisitory' do
      expect(student.school_repository).to eq(school_repository)
    end
  end

  describe '#attach' do
    it 'adds a mentor to the subscription list' do
      student.attach(mentor)
      expect(student.mentors_subs).to include(mentor)
    end
  end

  describe '#detach' do
    before { student.attach(mentor) }
    it 'delete a mentor from the subscription list', :aggregate_failures do
      expect { student.detach(mentor) }.to change { student.mentors_subs.size }.from(1).to(0)
      expect(student.mentors_subs).not_to include(mentor)
    end
  end

  describe '#notify' do
    context 'when student send notification to specific mentor'
    it 'adds this student to mentors students_to_check list' do
      student.notify(mentor)
      expect(mentor.students_to_check).to include(student)
    end
  end

  describe '#notify_all' do
    context 'when student send notification to all mentors'
    before do
      student.attach(mentor)
    end
    it 'adds this student to mentors students_to_check list' do
      student.notify_all
      expect(mentor.students_to_check).to include(student)
    end
  end

  describe '#update' do
    context 'when recive notification from mentor'
    before do
      # allow(homework).to receive(:readiness) { false } # this one is also okay, but it need stub with repo
      # homework.readiness = false
      allow(school_repository).to receive(:find).with(student.id, mentor.id).and_return(homework)
      allow(homework).to receive(:readiness).and_return(false)
    end
    it 'notification get added to the list' do
      student.update(mentor)
      expect(student.homework_to_do).to include(homework)
    end
  end

  describe '#do_homework' do
    context 'when students do his homework'
    it 'must return valid homework with random number from 1 to 10 in context' do
      student.do_homework(homework)
      expect(homework.content).to satisfy { |v| v >= 1 && v <= 10 } # rubocop:disable Lint/AmbiguousBlockAssociation
    end
  end

  describe '#submit_homework' do
    context 'when student submit his homework'
    before do
      student.attach(mentor)
    end
    it 'this student must showed up in his mentor\'s student_to_check' do
      student.submit_homework(homework, mentor.id)
      expect(mentor.students_to_check).to include(student)
    end
  end

  describe '#fix_homeworks' do
    context 'when student calls fix_homworks'
    before do
      # allow(student).to receive(:homework_to_do).and_return([homework]) # and now I must make :homework_to_do writable, how avoid it? How stub properly? Because this case not working
      # student.homework_to_do = [homework] # how to avoid it?
      student.instance_variable_set(:@homework_to_do, [homework])
    end
    it 'must redo all homeworks in homework_to_do list', :aggregate_failures do
      old_homework = homework.dup
      student.fix_homeworks
      expect(school_repository.find(student.id, mentor.id).eql?(old_homework)).to be == false
      expect(student.homework_to_do).to eq([])
    end
  end
end
