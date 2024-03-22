# frozen_string_literal: true

require_relative 'lib/services/image_download_service'
require_relative 'lib/services/file_reader_service'

rows = FileReaderService.new(path: ARGV[0]).call
puts rows

rows.each do |row|
  puts "Downloading: " + row
  ImageDownloadService.new(url: row).call
end
