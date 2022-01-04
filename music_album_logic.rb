require './music_album'
require './store_music_album'
require './read_music_album'

@music_albums = []

read_music_albums(@music_albums) if File.exist?('./music_albums.json')

def list_music_albums
  @music_albums.each_with_index do |g, i|
    puts "#{i + 1} - Publish Date: #{g.publish_date}"
  end
end

def add_music_album
  puts 'Publish Date: '
  publish_date = gets.chomp
  puts 'is on spotify (Y/N): '
  on_spotify = gets.chomp
  on_spot = on_spotify.downcase == 'y'
  music_album = MusicAlbum.new(publish_date, on_spotify: on_spot)
  puts music_album
  puts 'music album created successfully!'
  @music_albums << music_album
  store_music_album(@music_albums)
end
