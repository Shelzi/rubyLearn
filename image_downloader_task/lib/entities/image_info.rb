class ImageInfo
  attr_accessor :url, :file_name

  def initialize(url:)
    @url = url
    @file_name = File.basename(url)
  end
end
