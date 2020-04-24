require 'pry'

# Parses filenames from the file path folder and send the filenames
# to the Song class
class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    # A method putting file names into an array to be accessed in 
    # a different class method
    def files
        files = []
        Dir.new(self.path).each do |file|
            files << file if file.length > 4
        end
        files
    end

    def import
        self.files.each do |file| 
            Song.new_by_filename(file)
        end
    end


# binding.pry
end

