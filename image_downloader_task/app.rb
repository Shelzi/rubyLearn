require_relative 'lib/entities/download_task'
require_relative 'lib/entities/image_info'
require_relative 'lib/services/image_download_service'
require_relative 'lib/services/file_handler_service'


rows = FileHandlerService.new.read_lines_by_rows(path: ARGV[0]) 
puts rows
#url = 'https://i.ibb.co/c2jg54v/Screenshot-from-2024-02-28-22-58-08.png'

image_download_service = ImageDownloadService.new

rows.each do
    |row|
    puts row
    image_download_service.download_image(row)
end



