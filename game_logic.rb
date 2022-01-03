require './game'
require './store_games'
require './read_games'

@games = []

read_games(@games) if File.exist?('./games.json')

def list_games
  @games.each_with_index do |g, i|
    puts "#{i + 1} - Publish Date: #{g.publish_date}"
  end
end

def add_game
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
  store_games(@games)
end
