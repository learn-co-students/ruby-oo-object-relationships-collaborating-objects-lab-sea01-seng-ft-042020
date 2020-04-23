require "pry"
class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    # def self.create_by_name(name)
    #     artist = Artist.new(name)
    # end

    def self.find_or_create_by_name(name)
        @@all.any? {|artist| artist.name == name} ? @@all.find {|artist| artist.name == name} : Artist.new(name)
    end

    def print_songs
        self.songs.each {|song| print song.name+"\n"}
    end
end