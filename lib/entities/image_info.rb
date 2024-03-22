# frozen_string_literal: true

class ImageInfo
  attr_accessor :url

  def initialize(url:)
    @url = url
  end
end
