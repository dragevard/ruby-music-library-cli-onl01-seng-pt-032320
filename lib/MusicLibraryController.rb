class MusicLibraryController 
  
  def initialize(path = "./db/mp3s")
    file = MusicImporter.new(path)
    file.import
  end
  
  def list_songs
    sorted_songs = Song.all.sort_by do |song| 
        song.name 
      end 
      sorted_songs.each.with_index(1) do |index, song|
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  
end