class FileCreatorService
    def initialize(url:, response_body:)
        @url = url
        @response_body = response_body
    end

    def call
        validate_free_space!
        prepare_file_name
        create_file
    rescue StandardError => e
      raise FileHandlerError, "Error while creating a file: #{e.message}"
    end

    private

    attr_accessor :file_name

    def validate_free_space!
        #raise NoFreeSpaceError, "No free space for file creation: #{e.message}" unless FileSizeValidator.new.validate(response) #gem is not working at all, need help 
    end

    def prepare_file_name
        uri = URI(@url)
        relative_directory_path = File.join('downloads', 'images')
        # Get the basename of the URL path without extension
        basename = File.basename(uri.path, ".*")
        # Remove invalid characters from the basename (if any)
        basename = basename.gsub(/[^0-9A-Za-z.\-]/, '_')
        @file_name = File.join(relative_directory_path, "#{uri.host}-#{basename}.png")
    end

    def create_file
        relative_directory_path = File.join('downloads', 'images')
        FileUtils.mkdir_p(relative_directory_path)
        File.open(file_name, 'wb') do |file|
          file.write(@response_body)
        end
    end
end