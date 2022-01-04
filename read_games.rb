require './game'
require 'json'
def read_games(games)
  file = File.read('./games.json')
  hash_data_games = JSON.parse(file)
  hash_data_games.each do |hash|
    games << Game.new(hash['publish_date'], hash['multiplayer'], hash['last_played_at'])
  end
end
