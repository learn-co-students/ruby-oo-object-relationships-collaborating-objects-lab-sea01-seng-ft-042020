require 'pry'
class Artist
    attr_accessor :name

    @@all = []

    def initialize (name)
        @name = name

        save
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        found_artist = self.all.find {|artist| artist.name == name}
        if found_artist
            found_artist
        else
            new_artist = Artist.new(name)
        end
    end

    def print_songs
        songs.each do |songs|
            puts songs.name
        end
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
    #binding.pry
    0
end
