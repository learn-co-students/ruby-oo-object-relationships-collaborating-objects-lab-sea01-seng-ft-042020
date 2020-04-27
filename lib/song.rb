require 'pry'

 class Song
    attr_accessor :artist, :name

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename

    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
        artist.add_song(self)
    end

    def self.new_by_filename(filename)
        song_details = filename.split(" - ")
        song = Song.new(song_details[1])
        song.artist_name = song_details[0]
        song
    end

end