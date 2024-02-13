require_relative 'repository/repository'
require 'logger'

class SchoolRepository < Repository
  LOGGER = Logger.new($stdout)

  
  def find(student, mentor)
    @homeworks[student][mentor]
  end

  def save(homework, student, mentor)
    if homework.id.nil?
      homework.id = @next_id
      @next_id += 1
    end
    @homeworks[student][mentor] = homework
    LOGGER.info("homework #{homework.id} saved")
  end

  def delete(student, mentor)
    @homeworks[student][mentor] = nil
    LOGGER.info("homework deleted")
  end
end
