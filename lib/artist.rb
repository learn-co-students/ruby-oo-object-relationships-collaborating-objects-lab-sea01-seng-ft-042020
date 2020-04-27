require 'pry'

class Artist
    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize (name)
        @name = name
        @songs = []
        save
    end

    def save
        @@all << self
    end
    

    def self.all
        @@all
    end


    def add_song(song)
        @songs << song
    end

    def songs
        Song.all.select {|song| song.artist == self} + @songs
    end
    
    def self.find_or_create_by_name(artist_name)
         found_artist = @@all.find {|artist| artist.name == artist_name}
         if found_artist
            found_artist
        else
            Artist.new(artist_name)
        end
    end
 
    
    def print_songs
        @songs.map do |song|
            puts song.name
        end
    end




end

