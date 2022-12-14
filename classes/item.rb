require 'date'

class Item
  attr_accessor :publish_date, :genre, :author, :source
  attr_reader :id, :archived

  def initialize(publish_date)
    @id = rand(1..100_000)
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    current = Time.now.year
    difference = current - publish_date
    difference > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def label=(label)
    @label = label
    # label belongs to item
    label.items << self unless label.items.include?(self)
  end

  def add_genre=(genre)
    @genre = genre
  end
end
