# frozen_string_literal: true

module DownloadStrategy
  def download(url)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
