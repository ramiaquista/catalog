require './music_album'
require './store_music_album'
require './read_music_album'
require './read_genre'

@music_albums = []
@genres = []

read_music_albums(@music_albums) if File.exist?('./music_albums.json')
read_genres(@genres) if File.exist?('./genres.json')

def list_music_albums
  @music_albums.each_with_index do |g, i|
    puts "#{i + 1} - Publish Date: #{g.publish_date}"
  end
end

def add_music_album
  genre = genre_options
  puts 'Publish Date: '
  publish_date = gets.chomp
  puts 'is on spotify (Y/N): '
  on_spotify = gets.chomp
  on_spot = on_spotify.downcase == 'y'
  music_album = MusicAlbum.new(publish_date, on_spotify: on_spot)
  puts 'music album created successfully!'
  @music_albums << music_album
  genre.add_item(music_album)
  update_genre(genre)
  store_music_album(@music_albums)
end

def genre_options
  if @genres == []
    puts 'Creating a genre:'
    add_genre
  else
    puts 'Choose an option: '
    puts '1 - Select genre'
    puts '2 - Create a new genre'
    answ = gets.chomp
    if answ == '2'
      add_genre
      puts 'Select genre: '
    end
  end
  select_genre
end

def select_genre
  puts 'Select an genre from the list: '
  list_all_genres
  @selected_genre = gets.chomp
  genres = []
  genres = read_genres(genres)
  hash = genres[@selected_genre.to_i - 1]
  Genre.new(hash['name'])
end

def update_genre(genre)
  genres = []
  genres = read_genres(genres)
  genres[@selected_genres.to_i - 1] = genre
  store_genres(genres)
end
