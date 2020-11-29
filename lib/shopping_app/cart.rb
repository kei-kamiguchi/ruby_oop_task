require_relative "ownable"
require_relative "item_manager"

class Cart
  include ItemManager
  include Ownable

  def initialize(owner)
    self.owner = owner
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

  def check_out
    return if owner.wallet.balance < total_amount
    items.each do |item|
      item.owner.wallet.deposit(owner.wallet.withdraw(item.price))
      item.owner = owner
    end
    items.clear
  end

end