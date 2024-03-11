require_relative '../factories/download_strategy_factory'
require_relative '../services/file_handler_service'
require_relative '../errors/no_free_space_error'

class ImageDownloadService
  def download_image(url)
    image_info1 = ImageInfo.new(url: url)
    download_task1 = DownloadTask.new(image_info: image_info1)

    strategy = DownloadStrategyFactory.create(download_task1.image_info.url)
    responce_body = strategy.download(download_task1.image_info.url)
    new FileHandlerService.new.create_image_file_from_responce(url: download_task1.image_info.url,
                                                               response: responce_body)
  rescue StandardError => e
    # TODO: add counting feature to continue downloading next images
    puts "Failed to download #{url}: #{e.message}"
  end
end
