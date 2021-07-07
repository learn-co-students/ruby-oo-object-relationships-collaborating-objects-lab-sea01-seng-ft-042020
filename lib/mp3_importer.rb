require 'pry'

class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        files = []
        Dir[@path + "/*"].each {|path| files << File.basename(path)}
        files
    end

    def import
        self.files.each do |file|
            Song.new_by_filename(file)
        end
    end
end