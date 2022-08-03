require 'date'

class Item
  attr_accessor :label, :publish_date, :genre, :author, :source
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
end
