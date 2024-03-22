# frozen_string_literal: true

require_relative '../../entity/homework'

RSpec.describe Homework do
  let(:homework) { Homework.new(student_id: 1, mentor_id: 2, title: 'Ruby') }

  before do
    homework.id = 123
    homework.grade = true
    homework.content = 5
  end

  describe '.new' do
    it 'init with student_id, mentor_id and title' do
      expect(homework.student_id).to eq(1)
      expect(homework.mentor_id).to eq(2)
      expect(homework.title).to eq('Ruby')
    end
  end

  describe '#to_s' do
    it 'returns the string representation of the homework' do
      expected_output = "id: 123\nstudents id: 1\nmentor id: 2\ntitle: Ruby\nreadiness: false\ngrade: true\ncontrent: 5"
      expect(homework.to_s).to eq(expected_output)
    end
  end
end
