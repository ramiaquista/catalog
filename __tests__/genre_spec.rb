require './genre'
require './item'

describe Genre do
  context 'Creating an instance of a genre' do
    it 'should create a new instace of a genre' do
      name = 'Comedy'
      genre = Genre.new(name)
      expect(genre.name).to eq('Comedy')
    end
    it 'should check if can be archived ?' do
      item = Item.new('22/02/2022')
      genre = Genre.new(item)
      genre.add_item(item)
      expect(genre.items).to eq([item])
    end
  end
end
