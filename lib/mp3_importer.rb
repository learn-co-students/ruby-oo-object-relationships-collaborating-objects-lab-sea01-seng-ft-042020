class MP3Importer

    attr_accessor :path

    def initialize (path)
        @path = path
    end

    def files
        files = []
        Dir.new(@path).each do |file|
            if file.end_with?(".mp3")
                files << file 
            end
        end
        files
    end

    def import
        self.files.each do |file_name|
            Song.new_by_filename(file_name)
        end
    end
end