class MusicLibraryController
  
  def initialize (path = "./db/mp3s")
    MusicImporter.new(path).import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    answer = ""
    while answer != "exit"
      puts "What would you like to do?"
      answer = gets.strip
      case answer
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
    Song.all.sort_by {|song| song.name}.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
    Artist.all.sort_by {|artist| artist.name}.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
  end
  
  def list_genres
    Genre.all.sort_by {|genre| genre.name}.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    answer = gets.strip
    if Artist.find_by_name(answer)
      Artist.find_by_name(answer).songs.sort_by {|song| song.name}.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    answer = gets.strip
    if Genre.find_by_name(answer)
      Genre.find_by_name(answer).songs.sort_by {|song| song.name}.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    answer = gets.strip.to_i
    if answer > 0 && answer < Song.all.size
      song = Song.all.sort_by {|song| song.name}[answer - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
  
end
