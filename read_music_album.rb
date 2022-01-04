require './music_album'
require 'json'
def read_music_albums(music_albums)
  file = File.read('./music_albums.json')
  data_music_albums = JSON.parse(file)
  data_music_albums.each do |hash|
    music_albums << MusicAlbum.new(hash['publish_date'], on_spotify: hash['on_spotify'])
  end
end
