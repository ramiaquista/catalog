require './item'

class Genre
  attr_accessor :name, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def to_json(*)
    { name: @name, items: [] }.to_json
  end
end
