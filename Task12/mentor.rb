require_relative 'notification/observer'

class Mentor < Observer
  @@id_counter = 0
  attr_accessor :students
  attr_reader :id

  def initialize(students = []) # rubocop:disable Lint/MissingSuper
    @@id_counter += 1
    @id = @@id_counter
    @students = students
  end

  def update(student)
    puts "update from #{student.id}"
  end
end
