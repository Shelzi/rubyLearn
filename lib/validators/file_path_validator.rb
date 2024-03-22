# frozen_string_literal: true
require_relative 'validator'
require_relative '../errors/no_path_argument_error.rb'

class FilePathValidator < Validator
  def validate(path:)
    raise NoPathArgumentError, 'No path variable presented via terminal argument' if path.nil?
    # ???
  end
end
