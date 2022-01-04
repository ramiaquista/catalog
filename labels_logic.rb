require 'json'
require './label'
require './book'

@labels_list = []

def list_all_labels
  if File.exist?('./labels.json')
    data = File.read('./labels.json')
    hashes = JSON.parse(data)
    @labels_list = make_label_list(hashes) if @labels_list.any? == false
    @labels_list.each { |l| puts l.title.to_s.capitalize }
  else
    puts 'No labels created. must created a Book and Label to show.'
  end
end

def make_label_list(array_hashes)
  array_hashes.map { |label| Label.new(label['title'], label['color']) }
end

def sub_menu_label(book)
  puts 'Please choose: 1:[Create label] 2:[Use stored]'
  option = gets.chomp.to_i
  case option.to_i
  when 1
    create_label(book)
  when 2
    choose_label(book)
  end
end

def choose_label(book)
  if File.exist?('./labels.json')
    data = File.read('./labels.json')
    hashes = JSON.parse(data)
    @labels_list = make_label_list(hashes) if @labels_list.any? == false
    puts 'Please, select one of the labels by id:'
    @labels_list.each { |l| puts "#{l.id} #{l.title} #{l.color}" }
    option_selected = gets.chomp
    label = @labels_list.select { |l| l.id == option_selected.to_i }
    label[0].add_item({ publish_date: book.publish_date.to_s, publisher: book.publisher.to_s,
                        cover_state: book.cover_state.to_s })
    book.add_label(label)
    save_labels
    book
  else
    puts 'No labels stored'
    create_label(book)
  end
end

def create_label(book)
  puts 'input the title:'
  title = gets.chomp
  puts 'input the color:'
  color = gets.chomp
  label = Label.new(title, color)
  label.add_item({ publish_date: book.publish_date.to_s, publisher: book.publisher.to_s,
                   cover_state: book.cover_state.to_s })
  book.add_label(label)
  if File.exist?('./labels.json')
    data = File.read('./labels.json')
    hashes = JSON.parse(data)
    @labels_list = make_label_list(hashes) if @labels_list.any? == false
  end
  @labels_list.push(label)
  save_labels
  book
end

def save_labels
  array_json = []
  @labels_list.each do |l|
    array_json.push({ 'title' => l.title, 'color' => l.color,
                      'items' => l.items, 'id' => l.id }.to_json)
  end
  json = array_json.join(',')
  json = "[#{json}]"
  File.write('labels.json', json)
end
