require './item'

class Book < Item
  attr_accessor :id, :publisher, :publish_date, :cover_state

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
