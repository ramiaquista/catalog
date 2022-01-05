require './item'

class MusicAlbum < Item
  attr_accessor :publish_date, :on_spotify

  def initialize(publish_date, on_spotify: false)
    super(publish_date, archived: false)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    date = Date.parse(@publish_date)
    current_date = Time.now
    return true if current_date.year - date.year >= 10 && @on_spotify == true

    false
  end

  def to_json(*)
    { publish_date: @publish_date, on_spotify: @on_spotify }.to_json
  end
end
