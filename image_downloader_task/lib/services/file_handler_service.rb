require_relative '../validators/file_size_validator'
require_relative '../validators/file_path_validator'
require_relative '../validators/file_existance_validator'
require_relative '../errors/file_not_found_error'
require 'uri'
require 'fileutils'

class FileHandlerService
  def create_image_file_from_responce(url:, response_body:)
    #FileSizeValidator.new.validate(response) #gem is not working at all, need help

    uri = URI(url)
    relative_directory_path = File.join('downloads', 'images')
    # Get the basename of the URL path without extension
    basename = File.basename(uri.path, ".*")

    # Remove invalid characters from the basename (if any)
    basename = basename.gsub(/[^0-9A-Za-z.\-]/, '_')

    file_name = File.join(relative_directory_path, "#{uri.host}-#{basename}.png")
    FileUtils.mkdir_p(relative_directory_path)
    File.open(file_name, 'wb') do |file|
      file.write(response_body)
    end
  rescue NoFreeSpaceError => e
    raise FileHandlerError, "Error message: #{e.message}"
  end

  def read_lines_by_rows(path:)
    FilePathValidator.new.check_path(path: path)
    
    normalized_path = File.expand_path(path)
    
    FileExistanceValidator.new.check_file_existance(path: normalized_path)

    rows = File.readlines(normalized_path).map(&:chomp)
    rows
  end
end
