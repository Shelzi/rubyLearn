class FileExistanceValidator < Validator
    def check_file_existance(path:)
        normalized_path = File.expand_path(path)
        raise FileNotFoundError, "File not found: #{normalized_path}" unless File.exist?(normalized_path) 
    end
end
