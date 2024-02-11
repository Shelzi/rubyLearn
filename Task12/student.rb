require_relative 'notification/notifier'
require_relative 'notification/observer'
require 'logger'

class Student
  include Notifier
  include Observer

  LOGGER = Logger.new($stdout)

  @@id_counter = 0

  attr_reader :id

  def initialize()
    @@id_counter += 1
    @id = @@id_counter
    @mentors = []
  end

  def do_homework(homework)
    homework.content = rand(1..10)
    homework.readiness = true
    LOGGER.info("Homework #{homework.id} ready from student.id = #{id}")
    homework
  end

  def submit_homework(repository, homework, mentor)
    repository.save(homework, self, mentor)
    notify(mentor)
    LOGGER.info("Homework #{homework.id} submited from student #{id}")
  end

  def attach(mentor)
    @mentors << mentor
    LOGGER.info("Mentor #{mentor.id} attached to student #{id}")
  end

  def detach(mentor)
    @mentors.delete(mentor)
    LOGGER.info("Mentor #{mentor.id} detached from student #{id}")
  end

  def notify(mentor)
    mentor.update(self)
    LOGGER.info("Mentor #{mentor.id} notified from student #{id}")
  end

  # Получилось не так как надо. По итогу выходит, что как только выполнилась одна домашка - узнают все менторы.
  # А использовать метод notify(mentor) - какой тогда смысл в паттерне по итогу, если я его этим ломаю...
  def notify_all
    @mentors.each do |mentor|
      mentor.update(self)
    end
    LOGGER.info('All mentors notidied')
  end

  # очень спорная реализация, по факту студент должен сделать всё сам, а тут за него чуть ли не автоматически домашку делают
  # плюс я не использую метод интерфейса, это надо переделать
  def update(repository, mentor)
    homework = repository.find(self, mentor)
    return if homework.readiness

    homework = do_homework(homework)
    submit_homework(repository, homework, mentor)
    notify(mentor)
    LOGGER.info("Homework #{homework.id} fixed from student.id = #{id} and send to repository, mentor #{mentor.id} notified")
  end
end
