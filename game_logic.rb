require './game'
require './store_games'
require './read_games'
require './author_logic'
require './read_authors'

@games = []
@authors = []

read_games(@games) if File.exist?('./games.json')
read_authors(@authors) if File.exist?('./authors.json')

def list_games
  @games.each_with_index do |g, i|
    puts "#{i + 1} - Publish Date: #{g.publish_date}"
  end
end

def add_game
  author = author_options
  puts 'Publish Date: '
  publish_date = gets.chomp
  puts 'Multiplayer (Y/N): '
  multiplayer = gets.chomp
  mult = multiplayer.downcase == 'y'
  puts 'Last Date Played (YYYY/MM/DD): '
  last_played_at = gets.chomp
  game = Game.new(publish_date, mult, last_played_at)
  puts 'Game created successfully!'
  @games << game
  author.add_item(game)
  update_author(author)
  store_games(@games)
end

def author_options
  puts 'Choose an option: '
  puts '1 - Select author'
  puts '2 - Create a new author'
  answ = gets.chomp
  if answ == '2'
    add_author
    puts 'Select author: '
  end
  select_author
end

def select_author
  puts 'Select an author from the list: '
  list_all_authors
  @selected_author = gets.chomp
  authors = []
  authors = read_authors(authors)
  hash = authors[@selected_author.to_i - 1]
  Author.new(hash['first_name'], hash['last_name'])
end

def update_author(author)
  authors = []
  authors = read_authors(authors)
  authors[@selected_author.to_i - 1] = author
  store_authors(authors)
end
