# frozen_string_literal: true

require_relative '../validators/file_size_validator'
require_relative '../validators/file_path_validator'
require_relative '../validators/file_existance_validator'
require_relative '../errors/file_not_found_error'
require 'uri'
require 'fileutils'

class FileReaderService
  def call(path:)


    File.readlines(normalized_path).map(&:chomp)
  end

  private

  def validate!
    raise FilePathError, "Path to file is incorect: #{e.message}" unless FilePathValidator.new.check_path(path: path)
    normalized_path = File.expand_path(path)
    raise FileExistanceValidator.new.check_file_existance(path: normalized_path)
  end
end
