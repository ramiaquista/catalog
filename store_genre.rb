require 'json'
def store_authors(genres)
  File.write('genres.json', JSON.pretty_generate(genres), mode: 'w')
end
