class MP3Importer
    attr_accessor :path

    def initialize(path)
        self.path = path
    end

    def files
        Dir.entries(self.path).select {|file| file.end_with?(".mp3")} 
    end

    def import
        self.files.each {|file| Song.new_by_filename}
    end

end