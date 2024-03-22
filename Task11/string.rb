# frozen_string_literal: true

class String
  def palindrom?
    downcase == downcase.reverse
  end
end
