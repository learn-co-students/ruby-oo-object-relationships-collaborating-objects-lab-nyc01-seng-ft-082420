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
  
  def artist_name(artist)
    self.artist = artist
  end
  
  def self.new_by_filename(file)
    file = file.split("-")
    singer = file[0].strip
    title = file[1].strip
    song = Song.new(title)
    song.artist = Artist.find_or_create_by_name(singer)
    song
  end
  
  def artist_name=(name)
    Artist.find_or_create_by_name(name).add_song(self)
  end
end