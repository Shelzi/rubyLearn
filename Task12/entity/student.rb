require_relative '../notification/notifier'
require_relative '../notification/observer'
require_relative '../logger/my_logger'

class Student
  include Notifier
  include Observer

  @@id_counter = 0

  attr_reader :id

  def initialize
    @@id_counter += 1
    @id = @@id_counter
    @mentors_subs = []
    @homework_to_do = []
  end

  def do_homework(homework)
    homework.content = rand(1..10)
    homework.readiness = true
    homework
  end

  def submit_homework(repository, homework, mentor_id)
    repository.save(homework, id, mentor_id)
    notify(mentor)
  end

  def attach(mentor)
    @mentors_subs << mentor
  end

  def detach(mentor)
    @mentors_subs.delete(mentor)
  end

  def notify(mentor)
    mentor.update(self)
  end

  def notify_all
    @mentors_subs.each do |mentor|
      mentor.update(self)
    end
  end

  def update(repository, mentor)
    homework = repository.find(id, mentor.id)
    return if homework.readiness

    @homework_to_do << homework
  end

  def fix_homeworks(repository)
    return if @homework_to_do.empty?

    @homework_to_do.each do |homework|
      homework_to_submit = do_homework(homework)
      submit_homework(repository, homework_to_submit, homework.mentor_id) ##РЕШИТЬ ПРОБЛЕМУ С АЙДИ МЕНТОРА И ТД, ТИПО КАК ХРАНИТЬ В БД
    end

    @homework_to_do = []
  end
end
