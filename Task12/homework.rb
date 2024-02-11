class Homework
  attr_accessor :title, :readiness, :grade
  attr_reader :student_id, :id

  def initialize(student_id, title, readiness: false)
    @student_id = student_id
    @title = title
    @readiness = readiness
    @grade = false
  end

  def init_from_db(id, student_id, title, readiness)
    super(student_id, title, readiness)
    @id = id
  end
end
