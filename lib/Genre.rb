class Genre 
  extend Concerns::Findable
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name 
    save
    @songs = []
  end
  
  def self.create(name)
    new_genre = Genre.new(name)
  end
  
  def songs 
    @songs 
  end
  
  def self.all 
    @@all 
  end
  
  def save
    @@all << self 
  end
  
  def artists 
    artists = [] 
    songs.map do |song|
      artists << song.artist 
    end 
    artists.uniq 
  end
  def self.destroy_all
    @@all.clear
  end
end