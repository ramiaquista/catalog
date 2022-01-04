require './book'
require 'json'

@book_list = []

def list_all_books
  if File.exist?('./books.json')
    data = File.read('./books.json')
    hashes = JSON.parse(data)
    @book_list = make_book_list(hashes) if @book_list.any? == false
    @book_list.each { |b| puts "#{b.id} #{b.publisher} #{b.publish_date}" }
  else
    puts "There's no books stored, want to add ? 1:[Yes] 2:[No]"
    option = gets.chomp
    add_book if option.to_i == 1
  end
end

def make_book_list(array_hashes)
  array_hashes.map { |book| Book.new(book['publish_date'], book['publisher'], book['cover_state']) }
end

def add_book
  puts 'Input the publish date:'
  publish_date = gets.chomp
  puts 'Input the publisher:'
  publisher = gets.chomp
  puts 'Input the cover state:'
  cover_state = gets.chomp
end
