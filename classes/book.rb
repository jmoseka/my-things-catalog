require 'date'
require_relative './item'
class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(publisher, cover_state, publish_date)
    super(id, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
