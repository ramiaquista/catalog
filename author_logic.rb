require './author'

author1 = Author.new('Stephen', 'King')
author2 = Author.new('Miguel', 'de Cervantes')

@authors = [author1, author2]

def list_all_authors
  @authors.each_with_index do |a, i|
    puts "#{i + 1} - Author: #{a.first_name} #{a.last_name}"
  end
end
