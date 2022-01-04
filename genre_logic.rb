require './genre'
require './store_genre'
require './read_genre'

@genres = []

read_genres(@genres) if File.exist?('./genres.json')

def list_all_genres
  @genres.each_with_index do |a, i|
    puts "#{i + 1} - Genre: #{a.name} "
  end
end
