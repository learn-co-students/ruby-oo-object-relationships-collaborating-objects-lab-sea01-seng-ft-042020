class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
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

    def songs
        Song.all.select {|song| song.artist == self} + @songs
    end

    def add_song(song)
        @songs << song
    end

    def self.find_or_create_by_name(artist_name)
        unless @@all.find {|artist| artist.name == artist_name}
            Artist.new(artist_name)
        else
            @@all.find {|artist| artist.name == artist_name}
        end
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end
end