require_relative 'notification/notifier'

class Student < Notifier
  @@id_counter = 0
  attr_reader :id

  def initialize()
    @@id_counter += 1
    @id = @@id_counter
    @mentors = []
  end

  def attach(mentor)
    @mentors << mentor
  end

  # Detach an observer from the subject.
  def detach(mentor)
    @mentors.delete(mentor)
  end

  # Notify all observers about an event.
  def notify
    @mentors.each do |mentor|
      mentor.update(self)
    end
  end
end
