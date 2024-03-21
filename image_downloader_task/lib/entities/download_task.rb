class DownloadObject
  attr_accessor :image_info, :start_time, :end_time

  def initialize(image_info:)
    @image_info = image_info
    @start_time = Time.now
  end
end
