class Artist 
  extend Concerns::Findable
  
  attr_accessor :name, :song
  
  @@all = []
  
  def initialize(name)
    @name = name 
    save
    @songs = []
  end
  
  def songs 
    @songs 
  end
  
 
  def self.create(name)
    new_artist = Artist.new(name)
  end
  
  def self.all 
    @@all 
  end
  
  def save
    @@all << self 
  end

  def self.destroy_all
    @@all.clear
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self 
    end 
    if !@songs.include?(song)
      @songs << song 
    end
  end
  
  def genres 
    genres = [] 
    songs.map do |song|
      genres << song.genre 
    end 
    genres.uniq 
  end

end