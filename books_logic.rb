require './book'
require './read_books'
require './store_books'
require 'json'

def list_all_books
  if File.exist?('./books.json')
    data = File.read("./books.json")
    objects = JSON.parse(data)
    objects.each {|b| p "Publish Date: #{b['publish_date']} Publisher: #{b['publisher']}"}   
 else
    add_book
 end  
end

def add_book
  puts "Input the publish date:"
  publish_date = gets.chomp
  puts "Input the publisher:"
  publisher = gets.chomp
  puts "Input the cover state:"
  cover_state = gets.chomp
end