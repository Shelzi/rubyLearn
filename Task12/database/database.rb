class Database
  def initialize
    @homeworks = Hash.new { |hash, key| hash[key] = {} } # @homeworks[student][mentor] = homework
    @next_id = 0
  end

  def self.fetch; end

  def self.create; end

  def self.update; end

  def self.delete; end
end
