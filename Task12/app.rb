# frozen_string_literal: true

require_relative 'entity/homework'
require_relative 'entity/student'
require_relative 'entity/mentor'
require_relative 'repository/school_repository'
require 'logger'

LOGGER = Logger.new($stdout)

repository = SchoolRepository.new
LOGGER.info("Created new repository:\n #{repository}")
student1 = Student.new(repository)
LOGGER.info("Created new student 1:\n #{student1.to_s}")
mentor1 = Mentor.new(repository)
LOGGER.info("Created new mentor 1:\n #{mentor1.to_s}")
homework1 = Homework.new(student1.id, mentor1.id, 'Math')
LOGGER.info("Created new homework 2:\n #{homework1.to_s}")


student1.attach(mentor1)
LOGGER.info("Student #{student1.id} attached to mentor #{mentor1.id}. Student subs:\n#{student1.mentors_subs}")
student1.do_homework(homework1)
LOGGER.info("Student #{student1.id} did his homework:\n#{homework1.to_s}")
student1.submit_homework(homework1, homework1.mentor_id)
LOGGER.info("Student #{student1.id} submited his homework:\n#{repository.to_s}")

student2 = Student.new(repository)
homework2 = Homework.new(student2.id, mentor1.id, 'Music')
student2.attach(mentor1)
student2.do_homework(homework2)
student2.submit_homework(homework2, homework2.mentor_id)

mentor1.attach(student1)
mentor1.attach(student2)

still_homework_to_do = true
while still_homework_to_do
  mentor1.check_homeworks
  LOGGER.info("Mentor #{mentor1.id} checked all homeworks.\nStudent 1 #{student1.homework_to_do}\nStudent 2 #{student2.homework_to_do}")

  break if student1.homework_to_do.empty? && student2.homework_to_do.empty?

  LOGGER.info("Fixing...")
  student1.fix_homeworks
  student2.fix_homeworks
end
