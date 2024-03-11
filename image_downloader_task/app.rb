require_relative 'lib/entities/download_task'
require_relative 'lib/entities/image_info'
require_relative 'lib/services/image_download_service'

require 'net/http'
require 'uri'

# def download_image(url, filename)
#   uri = URI(url)
#   Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
#     request = Net::HTTP::Get.new(uri)
#     http.request(request) do |response|
#       open(filename, 'wb') do |file|
#         response.read_body do |chunk|
#           file.write(chunk)
#         end
#       end
#     end
#   end
# end

url = 'https://i.ibb.co/c2jg54v/Screenshot-from-2024-02-28-22-58-08.png'
image_download_service = ImageDownloadService.new
image_download_service.download_image(url)
# download_image(download_task1.image_info.url, download_task1.image_info.file_name)
