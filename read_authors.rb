require './author'
require 'json'
def read_authors(authors)
  file = File.read('./authors.json')
  hash_data_authors = JSON.parse(file)
  hash_data_authors.each do |hash|
    authors << Author.new(hash['first_name'], hash['last_name'])
  end
end
