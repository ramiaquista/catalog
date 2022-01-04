require './author'
require './store_authors'
require './read_authors'

@authors = []

read_authors(@authors) if File.exist?('./authors.json')

def add_author
  puts 'First Name: '
  first_name = gets.chomp
  puts 'Last Name: '
  last_name = gets.chomp
  author = Author.new(first_name, last_name)
  puts 'Author created successfully!'
  @authors << author
  store_authors(@authors)
end

def list_all_authors
  @authors.each_with_index do |a, i|
    puts "#{i + 1} - Author: #{a.first_name} #{a.last_name}"
  end
end
