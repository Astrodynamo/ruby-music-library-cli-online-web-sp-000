class MusicImporter
  attr_reader :path
  
  def initialize (path)
    @path = path
  end
  
  def files
    Dir["#{@path}/*.mp3"].map {|filename| filename.sub("#{@path}/", "")}
  end
  
  def self.import
    
  end
  
  def self.new_from_filename
    
  end
  
  def self.create_from_filename
    
  end
  
end

# from collaborating objects lab
#  def files
#    Dir["#{@path}/*.mp3"].map {|filename| filename.sub("#{@path}/", "")}
#  end
  
#  def import
#    self.files.each {|song| Song.new_by_filename(song)}
#  end