# frozen_string_literal: true

require_relative 'homework'
require_relative 'student'
require_relative 'mentor'
require_relative 'school_repository'

repository = SchoolRepository.new
LOGGER = Logger.new($stdout)
stundent1 = Student.new(id)
homework1 = Homework.new(stundent1.id, 'Math')
mentor1 = Mentor.new

stundent1.attach(mentor1)
stundent1.do_homework(homework1)
stundent1.submit_homework(repository, homework1, mentor1)
stundent1.notify_all

stundent2 = Student.new
homework2 = Homework.new(stundent2.id, 'Not math')
stundent2.attach(mentor1)
stundent2.do_homework(homework2)
stundent2.submit_homework(repository, homework2, mentor1)
stundent2.notify_all

mentor1.check_homeworks(repository)
student1.fix_homeworks(repository)

