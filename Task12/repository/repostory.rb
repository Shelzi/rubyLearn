class Repository
  def find(id)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def save(entity)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def delete(entity)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
