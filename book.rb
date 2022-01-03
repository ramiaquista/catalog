require './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if super || cover_state == 'bad'

    false
  end
end

book = Book.new('2000-01-04', 'castellana', 'good')

puts book.can_be_archived?
