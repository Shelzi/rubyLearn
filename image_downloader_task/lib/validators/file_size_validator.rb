# frozen_string_literal: true

require 'sys/filesystem'
# require 'rbconfig'

class FileSizeValidator < Validator
  def validate(response_body)
    data_size_bytes = response_body.bytesize

    directory_path = File.join('downloads', 'images')

    stat = Sys::Filesystem.stat(directory_path) # gem is not working at all, (can't modify frozen String: "") error
    available_bytes = stat.block_size * stat.blocks_available

    raise NoFreeSpaceError, 'There is not enough space on the disk.' unless available_bytes > data_size_bytes
  end
end
