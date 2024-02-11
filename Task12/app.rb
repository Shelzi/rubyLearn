# frozen_string_literal: true

require_relative 'homework'
require_relative 'student'
require_relative 'mentor'

stundent1 = Student.new
homework1 = Homework.new(stundent1.id, 'Math')
mentor1 = Mentor.new
stundent1.attach(mentor1)
stundent1.notify

stundent2 = Student.new
homework2 = Homework.new(stundent2.id, 'Not math')
stundent2.attach(mentor1)
stundent2.notify
