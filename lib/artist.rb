require 'pry'
require_relative 'song.rb'

class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end
    def self.all
        @@all
    end
    def songs
        @songs
    end
    def add_song(song)
        @songs << song
    end

    def print_songs
        temp = []
        self.songs.each {|i| temp << i.name}
        temp.each {|i| puts i}
    end

    def self.find_or_create_by_name(name)
        if @@all.any? { |i| i.name == name}
            @@all.find { |i| i.name == name}
        else
            Artist.new(name)
        end
    end
end
