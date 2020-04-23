require "pry"
class Artist
    attr_accessor :name

    @@all = []

    def initialize(artist_name)
        self.name = artist_name
        self.class.all.push(self)
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song_instance| song_instance.artist == self}
    end

    def add_song(song_instance)
        song_instance.artist = self
    end

    def self.find_or_create_by_name(artist_name)
        # I could'nt think of a cleaner way at the moment to see if this artist already existed
        existing_artist = self.all.find {|artist_instance| artist_instance.name == artist_name}
        existing_artist ? existing_artist : Artist.new(artist_name)
    end

    def print_songs
        puts self.songs.map {|song_instance| song_instance.name}
    end

end