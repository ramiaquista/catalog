class Label
  attr_accessor :items, :title, :color, :id

  def initialize(title, color)
    @id = rand(1...100)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
