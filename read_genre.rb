require './genre'
require 'json'
def read_genres(genres)
  file = File.read('./genres.json')
  data_genres = JSON.parse(file)
  data_genres.each do |hash|
    genres << Genre.new(hash['name'])
  end
end
