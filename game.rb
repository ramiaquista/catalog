require './item'

class Game < Item
  attr_accessor :publish_date, :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    date = Date.parse(@last_played_at)
    current_date = Time.now
    return true if super && current_date.year - date.year > 2

    false
  end
end
