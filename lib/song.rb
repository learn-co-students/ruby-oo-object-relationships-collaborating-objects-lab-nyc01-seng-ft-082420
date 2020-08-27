class Song
  attr_accessor :name, :artist
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    file = filename.sub(".mp3","").split(" - ")
    artist = Artist.new(file[0])
    song = self.new(file[1])
    song.artist = artist
    song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
end
