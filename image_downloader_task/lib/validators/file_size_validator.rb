require_relative 'validator'

class FileSizeValidator
  include Validator

  def validate(response_body)
    data_size_bytes = response_body.bytesize
    directory_path = 'download/images'
    stat = Sys::Filesystem.stat(directory_path)
    available_bytes = stat.block_size * stat.blocks_available

    raise NoFreeSpaceError, 'There is not enough space on the disk.' unless available_bytes > data_size_bytes
  end
end
