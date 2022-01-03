require './label'
require './item'

describe Label do
  it 'should return and empty array' do
    label = Label.new('Label One','red')
    expect(label.items.length).to eq(0)
  end
  
  it 'should return a length of one' do
    label = Label.new('Label One','red')
    item = Item.new('2021-01-05')
    label.add_item(item)
    expect(label.items.length).to eq(1)
  end
end