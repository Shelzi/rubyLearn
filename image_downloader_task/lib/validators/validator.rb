module Validator
  def validate(subject)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
