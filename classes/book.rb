require 'date'
require_relative './item'
class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(publisher, cover_state)
    super(publish_date: Date.today.to_s)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
