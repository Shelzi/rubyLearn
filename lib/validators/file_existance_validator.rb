# frozen_string_literal: true
require_relative 'validator'

class FileExistanceValidator < Validator
  def validate(path:)
    normalized_path = File.expand_path(path)
    raise FileNotFoundError, "File not found: #{normalized_path}" unless File.exist?(normalized_path)
  end
end
