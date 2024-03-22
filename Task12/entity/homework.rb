# frozen_string_literal: true

class Homework
  attr_accessor :title, :readiness, :grade, :content, :id # id writeble only for repo emulation, not really a solution
  attr_reader :student_id, :mentor_id

  def initialize(student_id:, mentor_id:, title:, readiness: false)
    @student_id = student_id
    @mentor_id = mentor_id
    @title = title
    @readiness = readiness
  end

  def to_s
    "id: #{id}\nstudents id: #{student_id}\nmentor id: #{mentor_id}\ntitle: #{title}\nreadiness: #{readiness}\ngrade: #{grade}\ncontrent: #{content}"
  end

  def eql?(other)
    other.is_a?(Homework) &&
      student_id == other.student_id &&
      mentor_id == other.mentor_id &&
      title == other.title &&
      readiness == other.readiness
  end
end
