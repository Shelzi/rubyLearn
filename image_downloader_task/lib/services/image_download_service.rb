require_relative '../factories/download_strategy_factory'
require_relative '../services/file_handler_service'
require_relative '../errors/no_free_space_error'

class ImageDownloadService

  attr_reader :download_object

  def initialize(url:)
    @url = url
  end

  def download_image(url)


    strategy = DownloadStrategyFactory.create(download_task1.image_info.url)
    responce_body = strategy.download(download_task1.image_info.url)
    FileHandlerService.new.create_image_file_from_responce(url: download_task1.image_info.url,
                                                               response_body: responce_body)
  rescue StandardError => e
    # TODO: add counting feature to continue downloading next images
    puts "Failed to download #{url}: #{e.message}"
  end

  def call
    validate!
    create_download_object
  end

  def validate!
    #TODO: url validators
  end

  def create_download_object
    image_info = ImageInfo.new(url: @url)
    @download_object = DownloadObject.new(image_info: image_info)
  end


end
