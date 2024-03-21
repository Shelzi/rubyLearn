class FilePathValidator < Validator
    def check_path(path:)
        raise NoPathArgumentPresented, 'No path variable presented via terminal argument' if path.nil?
        # ???
    end
end
