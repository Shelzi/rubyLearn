# frozen_string_literal: true

module Observer
  def update(_subject)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
