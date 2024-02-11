require_relative 'notification/observer'
require 'logger'

class Mentor
  include Observer

  LOGGER = Logger.new($stdout)

  @@id_counter = 0

  attr_accessor :subscribed_students, :students_to_check
  attr_reader :id

  def initialize(subscribed_students = [])
    @@id_counter += 1
    @id = @@id_counter
    @subscribed_students = subscribed_students
    @students_to_check = []
  end

  def update(student)
    students_to_check << student
    LOGGER.info("student #{student.id} is in a wait-list to check homework")
  end

  def check_homeworks(repository)
    LOGGER.info("Wait-list right now is #{students_to_check}")
    students_to_check.each do |student|
      homework = repository.find(student, self)
      homework.grade = (homework.content >= 5)
      homework.readiness = false if homework.grade
      repository.save(homework, student, self)
      student.update(homework, repository, self) #это надо переделать, нужна помощь. Что-то по типу двусторонней подписки? Или проверять друг друга, что есть бред.
    end
    @students_to_check = []
    LOGGER.info("all homeworks checked")
  end
end
