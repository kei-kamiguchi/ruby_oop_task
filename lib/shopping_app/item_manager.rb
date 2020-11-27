require_relative "item"
require_relative "item_status"

module ItemManager
  def items
    Item.all.select{|item| item.owner == self }
  end

  def trigger_payment
  end

  def trigger_delivery
  end
end