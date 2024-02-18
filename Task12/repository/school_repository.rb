require_relative 'repository'

class SchoolRepository < Repository
  def initialize
    super
    @homeworks = Hash.new { |hash, key| hash[key] = {} } # @homeworks[student][mentor] = homework
    @next_id = 0
  end

  def find(student, mentor)
    @homeworks[student][mentor]
  end

  def save(homework, student, mentor)
    assign_homework_id(homework)
    @homeworks[student][mentor] = homework
  end

  def delete(student, mentor)
    @homeworks[student][mentor] = nil
  end

  def to_s
    "id: #{@id}\n homeworks connections:\n#{@homeworks}"
  end

  private

  def assign_homework_id(homework)
    return unless homework.id.nil?

    homework.id = @next_id
    @next_id += 1
  end
end
