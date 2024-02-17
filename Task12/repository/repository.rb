
# !!!Всё ещё спорный репозиторий, методы не универсальные, пока хз, только если менять имплементацию репозитория в целом

class Repository
  def find(student, mentor)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def save(homework, student, mentor)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def delete(student, mentor)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
