require 'date'

class Item
  attr_reader :archived, :author, :source, :genre, :label

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
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
