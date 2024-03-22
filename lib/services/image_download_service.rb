# frozen_string_literal: true

require_relative '../factories/download_strategy_factory'
require_relative 'file_creator_service'
require_relative '../errors/no_free_space_error'
require_relative '../errors/image_download_error'
require_relative '../validators/file_size_validator'
require_relative '../entities/image_info'
require_relative '../entities/download_object'

class ImageDownloadService
  def initialize(url:)
    @url = url
  end

  def call
    validate_url!
    create_download_object
    strategy = DownloadStrategyFactory.create(url: @download_object.image_info.url)
    @response_body = strategy.download(@download_object.image_info.url)
    validate_create_conditions!
    create_file(response_body: @response_body)
  rescue StandardError => e
    # TODO: add counting feature to continue downloading next images
    raise ImageDownloadError, "Failed to download #{@url}: #{e.message}"
  end

  private

  attr_reader :download_object, :response_body

  def validate_url!
    # TODO: url validators
  end

  def validate_create_conditions!
    # raise NoFreeSpaceError, "No free space" unless FileSizeValidator.new.validate(@response_body) #gem is not working
    # TODO: file creation validators
  end

  def create_download_object
    image_info = ImageInfo.new(url: @url)
    @download_object = DownloadObject.new(image_info: image_info)
  end

  def create_file(response_body:)
    FileCreatorService.new(url: download_object.image_info.url, response_body: @response_body).call
  end
end
