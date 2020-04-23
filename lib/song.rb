class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        self.name = name
        self.class.all.push(self)
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        parsed_filename = filename.chomp(".mp3").split(" - ")
        song = self.new(parsed_filename[1])
        song.artist = Artist.find_or_create_by_name(parsed_filename[0])
        song
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end
end