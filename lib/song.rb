
# Responsible for creating songs given each filename and sending
# the artists 
class Song

    attr_accessor :name, :artist
    attr_reader :file_name
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    # Storing and reading an instance in the @@all array
    def save
        @@all << self
    end

    def self.all
        @@all
    end

    #   
    def artist_name=(name)
        self.artist = 
        Artist.find_or_create_by_name(name)
        # Artist.add_song(self)
    end

    #   Gets individual, unparsed filenames from .import in MP3Importer
    def self.new_by_filename(file_name)

        #   unparses file and stores in song_info
        song_info = file_name.chomp(".mp3").split(" - ")

        #   creates new Song instance with parsed name
        song = Song.new(song_info[1])

        #   sends song with parsed name to .artist_name in Song class
        #   and returns song
        song.artist_name = song_info[0]
        song
    end
end