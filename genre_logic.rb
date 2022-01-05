require './genre'
require './store_genre'
require './read_genre'

@genres = []

read_genres(@genres) if File.exist?('./genres.json')

def add_genre
  puts 'Name: '
  name = gets.chomp
  genre = Genre.new(name)
  puts 'Genre created successfully!'
  @genres << genre
  store_genres(@genres)
end

def list_all_genres
  @genres.each_with_index do |a, i|
    puts "#{i + 1} - Genre: #{a.name} "
  end
end
