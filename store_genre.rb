require 'json'
def store_genres(genres)
  File.write('genres.json', JSON.pretty_generate(genres), mode: 'w')
end
