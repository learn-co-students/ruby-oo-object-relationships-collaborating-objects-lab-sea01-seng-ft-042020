class Song
    attr_accessor :name, :artist

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

    def self.new_by_filename(filename)
        Song.new(filename.split(" - ")[1])
        Song.all.last.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
        Song.all.last
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end