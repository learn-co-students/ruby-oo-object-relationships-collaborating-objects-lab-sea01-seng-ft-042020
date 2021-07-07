require 'pry'
require_relative 'artist.rb'
class Song
    attr_accessor :name
    attr_reader :artist
     
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    def artist=(artist)
        @artist = artist
        artist.songs << self
    end
    def artist_name=(artist_string)
        if Artist.all.any? { |i| i.name == artist_string}
            temp = Artist.all.find {|i| i.name == artist_string }
            self.artist=(temp)
        else
            self.artist=(Artist.new(artist_string))
        end
    end

    def self.new_by_filename(file_name)
        temp_artist = file_name.split(" - ")[0]
        temp_name = file_name.split(" - ")[1]
        temp_song = Song.new(temp_name)
        temp_song.artist_name=(temp_artist)
        temp_song
    end

    def self.all
        @@all
    end
end