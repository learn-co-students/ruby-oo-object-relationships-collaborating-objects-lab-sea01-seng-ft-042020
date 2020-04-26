require 'pry'
class MP3Importer
    attr_reader :path
    @@all = []
    def initialize(path)
        @path = path
        @@all << self
    end
    def files
        temp = []
        # binding.pry
        d = Dir.new(@path)
        d.each do |string|
            if string.end_with?(".mp3")
                temp << string
            end
        end
        temp
    end
    def import 
        self.files.each do |file_name|
            Song.new_by_filename(file_name)
        end
    end
end