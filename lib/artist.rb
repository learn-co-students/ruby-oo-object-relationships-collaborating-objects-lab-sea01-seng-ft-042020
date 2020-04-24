require 'pry'

# Responsible for either creating the artist (if the artist doesn't exist
# in our progrma yet) or finding the instance of that artist.
class Artist
    attr_accessor :name, :songs
    @@all = []
    def initialize(name)
        @name = name
        @songs = 
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(name)
        name.artist = self
    end


    # Method created to add artist tag to new song in Song class
    def self.find_or_create_by_name(name)
        if @@all.find {|artist| artist.name == name}
            @@all.find {|artist| artist.name == name}
        else
            new_artist = Artist.new(name)
        end
    end

    def print_songs
        song_array = self.songs.map {|song| song.name }
        song_string = song_array.join("\n")
        puts song_string
    end
    
end
# binding.pry
