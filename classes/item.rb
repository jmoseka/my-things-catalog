class Item
  attr_accessor :label, :publish_date, :genre, :author, :source
  attr_reader :id, :archived

  def initialize(publish_date:, id:, archived: false)
    @id = id || Random.rand(1..1_000_000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def can_be_archived?
    DateTime.now.year - @published_date.year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
