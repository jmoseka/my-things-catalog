class Item
  attr_accessor :label, :publish_date, :genre, :author, :source
  attr_reader :id, :archived

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(publish_date, archived = false, id = rand(1..100_000))
    super()
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    current = Time.now.year
    difference = current - publish_date.to_i
    difference > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
