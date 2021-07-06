class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        parsed = file.split(" - ")
        artist = parsed[0]
        name = parsed[1]
        new_name = Song.new(name)
        new_name.artist_name = artist
        new_name
    end

    def artist_name=(artist)
        new_artist = Artist.find_or_create_by_name(artist)
        new_artist.add_song(self)
    end
end