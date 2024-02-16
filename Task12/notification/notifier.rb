module Notifier
  def attach(observer)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # Detach an observer from the subject.
  def detach(observer)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # Notify all observers about an event.
  def notify_all
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # Notify special observers about an event.
  def notify(observer)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
