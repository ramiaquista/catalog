require 'date'

class Item
  attr_accessor :archived, :author, :source, :genre, :label

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre()
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
  end

  def can_be_archived?
    date = Date.parse(@publish_date)
    current_date = Time.now
    return true if current_date.year - date.year >= 10

    false
  end

  def move_to_archive
    result = can_be_archived?
    @archived = result
  end
end

