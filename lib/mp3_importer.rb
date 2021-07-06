require "pry"
class MP3Importer
    attr_accessor :path
    def initialize(path)
        @path = path
    end

    def files
        Dir.new(@path).select {|file|file.end_with?(".mp3")}
    end

    def import
        self.files.map {|filename| Song.new_by_filename(filename)}
    end
end