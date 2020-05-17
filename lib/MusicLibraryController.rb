class MusicLibraryController 
  
  def initialize(path = "./db/mp3s")
    file = MusicImporter.new(path)
    file.import
  end
  
  def call 
    input = nil 
    
    while user_input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
    
      input = gets.strip

      case user_input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end
  def list_songs
    sorted_songs = Song.all.sort_by do |song| 
      song.name 
    end 
    sorted_songs.each.with_index(1) do |index, song|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    sorted_artists = Artist.all.sort_by do |artist|
      artist.name 
    end 
    sorted_artists.each.with_index(1) do |index, artist| 
      puts "#{index}. #{artist.name}"
    end
  end
  
  def list_genres
    sorted_genres = Genre.all.sort_by do |genre|
      genre.name 
    end
    sorted_genres.each.with_index(1) do |index, genre|
      puts "#{index}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist 
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.find_by_name(input)
      sorted_songs = artist.songs.sort_by do |song|
        song.name 
      end
      sorted_songs.each.with_index(1) do |index, song| 
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if genre = Genre.find_by_name(input)
      sorted_songs= genre.songs.sort_by do |song|
        song.name
      end
      songs_sorted_by_name.each.with_index(1) do |song,index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort_by(&:name)(input - 1)
    end
  end
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
    
end