class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived
  attr_reader :id

  def initialize(_archived, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  private

  def can_be_archived?
    DateTime.now.year - @published_date.year > 10
  end

  public

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
