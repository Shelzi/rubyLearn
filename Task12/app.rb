# frozen_string_literal: true

require_relative 'entity/homework'
require_relative 'entity/student'
require_relative 'entity/mentor'
require_relative 'repository/repositoty_impl/school_repository'

repository = SchoolRepository.new
stundent1 = Student.new
mentor1 = Mentor.new
homework1 = Homework.new(stundent1.id, mentor1.id, 'Math')


stundent1.attach(mentor1)
stundent1.do_homework(homework1)
stundent1.submit_homework(repository, homework1, homework1.mentor_id)
stundent1.notify_all # всё ещё не особо рабочая страта

stundent2 = Student.new
homework2 = Homework.new(stundent2.id, mentor1.id, 'Music')
stundent2.attach(mentor1)
stundent2.do_homework(homework2)
stundent2.submit_homework(repository, homework2, homework2.mentor_id)
stundent2.notify_all

mentor1.check_homeworks(repository)
student1.fix_homeworks(repository)
