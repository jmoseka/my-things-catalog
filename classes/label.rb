require_relative './item'

class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(title:, color:)
    @title = title
    @color = color
    @id = Random.rand(1..1000)
    @items = []
  end

  def add_item(item)
    # item has many labels
    @items << item
    item.label = self
  end
end
