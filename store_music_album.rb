require 'json'
def store_music_album(music_albums)
  File.write('music_albums.json', JSON.pretty_generate(music_albums), mode: 'w')
end
