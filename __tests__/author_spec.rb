require './author'
require './item'

describe Author do
  context 'Creating an instance of an Author' do
    it 'should create a new instace of an Author with a first name as parameter' do
      first_name = 'Miguel'
      author = Author.new(first_name, 'Cervantes')
      expect(author.first_name).to eq('Miguel')
    end
    it 'should create a new instace of an Author with a last name as parameter' do
      last_name = 'Cervantes'
      author = Author.new('Miguel', last_name)
      expect(author.last_name).to eq('Cervantes')
    end
    it 'should create a new instace of an Author with a first name and last_name as parameters' do
      first_name = 'Miguel'
      last_name = 'Cervantes'
      author = Author.new(first_name, last_name)
      expect(author.first_name).to eq('Miguel')
      expect(author.last_name).to eq('Cervantes')
    end
    it 'should return an empty list of items' do
      author = Author.new('Miguel', 'Cervantes')
      expect(author.items.length).to eq(0)
    end
    it 'should return a list of 1 item' do
      author = Author.new('Miguel', 'Cervantes')
      item = Item.new('2018-10-10')
      author.add_item(item)
      expect(author.items.length).to eq(1)
      expect(author.items).to eq([item])
    end
  end
end
