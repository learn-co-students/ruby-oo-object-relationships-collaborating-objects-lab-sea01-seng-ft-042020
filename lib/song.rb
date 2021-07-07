class Song

    attr_accessor :name, :artist
    attr_reader

    @@all = []

    def initialize (name)
        @name = name

        save
    end

    # def artist=(artist)
    #     @artist = artist
    #     @@all<<self
    # end

    def self.new_by_filename(file_name)
        artist_name = file_name.split(" - ")[0]
        song_name = file_name.split(" - ")[1]
        new_song = Song.new(song_name)
        new_song.artist_name = artist_name
        # binding.pry
        new_song
    end

    def artist_name=(artist_string)
        self.artist = Artist.find_or_create_by_name(artist_string)
        # binding.pry
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end