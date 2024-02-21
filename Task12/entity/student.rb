require_relative '../notification/notifier'
require_relative '../notification/observer'
require 'pry'

class Student
  include Notifier
  include Observer

  @@id_counter = 0

  attr_reader :id, :mentors_subs, :homework_to_do

  def initialize(school_repository:)
    @@id_counter += 1
    @id = @@id_counter
    @mentors_subs = []
    @homework_to_do = []
    @school_repository = school_repository
  end

  def do_homework(homework)
    homework.content = rand(1..10)
    homework.readiness = true
    homework
  end

  def submit_homework(homework, mentor_id)
    @school_repository.save(homework, id, mentor_id)
    @mentors_subs.each do |mentor|
      notify(mentor) if mentor.id == mentor_id # какой-то трындец конечно, но уже как-то
    end
  end

  def attach(mentor)
    mentors_subs << mentor
  end

  def detach(mentor)
    mentors_subs.delete(mentor)
  end

  def notify(mentor)
    mentor.update(self)
  end

  def notify_all
    mentors_subs.each do |mentor|
      mentor.update(self)
    end
  end

  def update(mentor)
    homework = @school_repository.find(id, mentor.id)
    return if homework.readiness

    homework_to_do << homework
  end

  def fix_homeworks
    return if homework_to_do.empty?

    homework_to_do.each do |homework|
      homework_to_submit = do_homework(homework)
      submit_homework(homework_to_submit, homework.mentor_id)
    end
    @homework_to_do = []
  end

  def to_s
    "id: #{id}\nmentors subs: #{mentors_subs}\nhomework_to_do: #{homework_to_do}"
  end
end
