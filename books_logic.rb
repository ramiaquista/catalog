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
  book = Book.new(publish_date, publisher, cover_state)
  @book_list.push(book)
  puts 'Book added successfully. Add more 1:[Yes] 2:[No]'
  response = gets.chomp
  if response.to_i == 1
    add_book
  else
    save_book
  end
end

def save_book
  array_json = []
  @book_list.each do |b|
    array_json.push({ 'publish_date' => b.publish_date, 'publisher' => b.publisher,
                      'cover_state' => b.cover_state, 'id' => b.id }.to_json)
  end
  json = array_json.join(',')
  json = "[#{json}]"
  File.write('books.json', json)
end
