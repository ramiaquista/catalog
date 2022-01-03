require './author'
require './store_authors'
require './read_authors'

@authors = []

read_authors(@authors) if File.exist?('./authors.json')

def list_all_authors
  @authors.each_with_index do |a, i|
    puts "#{i + 1} - Author: #{a.first_name} #{a.last_name}"
  end
end
