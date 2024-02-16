require_relative '../logger/my_logger'

class MyLogger
  @logger = nil

  class << self
    attr_accessor :logger
  end

  def self.instance
    @logger ||= Logger.new($stdout)
  end

  private_class_method :new

  def self.log(message)
    instance.info(message)
  end

  def self.error(message)
    instance.error(message)
  end
end
