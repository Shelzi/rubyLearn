class Homework
  attr_accessor :title, :readiness, :grade, :content, :id #id тут writeble только для эмуляции репозитория
  attr_reader :student_id, :mentor_id

  def initialize(student_id, mentor_id, title, readiness: false)
    @student_id = student_id
    @mentor_id = mentor_id
    @title = title
    @readiness = readiness
  end

  def to_s
    "id: #{id}\nstudents id: #{student_id}\nmentor id: #{mentor_id}\ntitle: #{title}\nreadiness: #{readiness}\ngrade: #{grade}\ncontrent: #{content}"
  end
end
