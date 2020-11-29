require_relative "item_manager"

class Cart
  include ItemManager
  attr_reader :owner

  def initialize(owner)
    @owner = owner
    @contents = []
  end

  def items
    @contents
  end

  def add(item)
    @contents << item
  end

  def total_amount
    items.sum(&:price)
  end

end