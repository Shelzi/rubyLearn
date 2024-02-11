class ShcoolRepository < Repository
  def initialize # rubocop:disable Lint/MissingSuper
    @homeworks = Hash.new { |hash, key| hash[key] = {} }
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

  def delete(entity)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
