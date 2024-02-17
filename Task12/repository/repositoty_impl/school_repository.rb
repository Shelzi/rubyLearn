require_relative '../repository' # ??
require_relative '../../logger/my_logger'

class SchoolRepository < Repository
  def initialize # rubocop:disable Lint/MissingSuper
    @homeworks = Hash.new { |hash, key| hash[key] = {} } # @homeworks[student][mentor] = homework
    @next_id = 0
  end

  def find(student, mentor)
    @homeworks[student][mentor]
  end

  def save(homework, student, mentor)
    if homework.id.nil?
      homework.id = @next_id
      @next_id += 1
    end
    @homeworks[student][mentor] = homework
  end

  def delete(student, mentor)
    @homeworks[student][mentor] = nil
  end

  def to_s
    "id: #{@id}\n homeworks connections:\n#{@homeworks}"
  end

end
