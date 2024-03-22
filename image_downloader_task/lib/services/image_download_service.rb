# frozen_string_literal: true

require_relative '../factories/download_strategy_factory'
require_relative '../services/file_handler_service'
require_relative '../errors/no_free_space_error'

class ImageDownloadService
  def initialize(url:)
    @url = url
  end

  def call
    validate!
    create_download_object
    strategy = DownloadStrategyFactory.create(@download_object.image_info.url)
    responce_body = strategy.download(download_task1.image_info.url)
    create_file(responce_body)
  rescue StandardError => e
    # TODO: add counting feature to continue downloading next images
    raise ImageDownloadError, "Failed to download #{url}: #{e.message}"
  end

  private

  attr_reader :download_object

  def validate_url!
    # TODO: url validators
  end

  def validate_create_conditions!
    raise FileHandlerError, "No free space: #{e.message}" unless FileSizeValidator.validate(responce_body)
    
    # TODO: file creation validators
  end

  def validate_file!

  def create_download_object
    image_info = ImageInfo.new(url: @url)
    @download_object = DownloadObject.new(image_info: image_info)
  end

  def create_file(response_body:)
    FileHandlerService.new.create_image_from_responce(url: download_object.image_info.url, response_body: responce_body)
  end
end
