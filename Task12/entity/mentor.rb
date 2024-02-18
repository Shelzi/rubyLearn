require_relative '../notification/observer'
require_relative '../notification/notifier'

class Mentor
  include Observer
  include Notifier

  @@id_counter = 0

  attr_accessor :students_subs, :students_to_check
  attr_reader :id

  def initialize(school_repository)
    @@id_counter += 1
    @id = @@id_counter
    @students_subs = []
    @students_to_check = []
    @school_repository = school_repository
  end

  def update(student)
    students_to_check << student
  end

  def attach(student)
    students_subs << student
  end

  def detach(student)
    students_subs.delete(student)
  end

  def notify(student)
    student.update(self)
  end

  def notify_all
    students_subs.each do |student|
      student.update(self)
    end
  end

  def submit_homework(homework, student)
    @school_repository.save(homework, student.id, id)
    notify(student)
  end

  def check_homeworks
    students_to_check.each do |student|
      homework = @school_repository.find(student.id, id)
      homework.grade = (homework.content >= 5)
      homework.readiness = homework.grade
      submit_homework(homework, student)
    end
    students_to_check = []
  end

  def to_s
    "id: #{id}\nstudents subs: #{students_subs}\nstudents to check: #{students_to_check}"
  end
end
