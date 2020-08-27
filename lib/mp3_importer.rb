class MP3Importer
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    arr = []
    Dir.each_child(path){|filename| arr << filename if filename.end_with?(".mp3")}
    arr
  end

  def import
    self.files.each{|filename| Song.new_by_filename(filename)}
  end
end
