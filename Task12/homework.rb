class Homework
  attr_accessor :title, :readiness, :grade, :content, :id #id тут writeble только для эмуляции репозитория
  attr_reader :student_id

  def initialize(student_id, title, readiness: false)
    @student_id = student_id
    @title = title
    @readiness = readiness
  end

  def init_from_db(id, student_id, title, readiness, grade, content) # rubocop:disable Metrics/ParameterLists
    super(student_id, title, readiness)
    @id = id
    @grade = grade
    @content = content
  end
end
