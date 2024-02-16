require_relative '../notification/observer'
require_relative '../notification/notifier'
require_relative '../logger/my_logger'

class Mentor
  include Observer
  include Notifier

  @@id_counter = 0

  attr_accessor :subscribed_students, :students_to_check
  attr_reader :id

  def initialize()
    @@id_counter += 1
    @id = @@id_counter
    @students_subs = []
    @students_to_check = []
  end

  def update(student)
    students_to_check << student
  end

  def attach(student)
    @students_subs << student
  end

  def detach(student)
    @students_subs.delete(student)
  end

  def notify(student)
    student.update(self)
  end

  def notify_all
    @students_subs.each do |student|
      student.update(self)
    end
  end

  def submit_homework(repository, homework, student)
    repository.save(homework, student.id, id)
    notify(student)
  end

  def check_homeworks(repository)
    students_to_check.each do |student|
      homework = repository.find(student.id, id)
      homework.grade = (homework.content >= 5)
      homework.readiness = false if homework.grade
      submit_homework(repository, homework, student)
    end
    @students_to_check = []
  end
end
