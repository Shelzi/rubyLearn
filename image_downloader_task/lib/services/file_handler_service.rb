require_relative '../validators/file_size_validator'

class FileHandlerService
  def create_image_file_from_responce(url:, response:)
    FileSizeValidator.validate(response)

    uri = URI(url)
    relative_directory_path = 'downloads/images'
    file_name = File.join(relative_directory_path, "#{uri.host}-#{File.basename(uri.path)}")
    File.open(file_name, 'wb') do |file|
      file.write(response.body)
    end
  rescue NoFreeSpaceError => e
    raise FileHandlerError, "Error message: #{e.message}"
  end
end
