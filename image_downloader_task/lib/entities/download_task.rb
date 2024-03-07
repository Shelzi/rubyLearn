require_relative 'download_status'

class DownloadTask
  attr_accessor :image_info, :status, :start_time, :end_time

  def initialize(image_info:)
    @image_info = image_info
    @status = DownloadStatus::QUEUED
    @start_time = Time.now
  end

  def update_status(new_status)
    raise ArgumentError, "Invalid status: #{new_status}" unless DownloadStatus.constants.include?(new_status.to_sym)

    @status = DownloadStatus.const_get(new_status.to_sym)
  end
end
