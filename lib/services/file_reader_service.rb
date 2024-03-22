# frozen_string_literal: true

require_relative '../validators/file_size_validator'
require_relative '../validators/file_path_validator'
require_relative '../validators/file_existance_validator'
require_relative '../errors/file_not_found_error'
require_relative '../errors/file_path_error'
require 'uri'
require 'fileutils'

class FileReaderService
  def initialize(path:)
    @path = path
  end
  
  def call(path: @path)
    validate!
    normalized_path = File.expand_path(path)
    File.readlines(normalized_path).map(&:chomp)
  end

  private

  attr_reader :path

  def validate!
    begin
      raise FilePathError, "Path to file is incorect: #{e.message}" unless FilePathValidator.new.validate(path: @path)
      raise FileNotFoundError, "File not found: #{e.message}" unless FileExistanceValidator.new.validate(path: @path)
    rescue => e
      puts "An error occurred: #{e.message}"
    end
  end
end
