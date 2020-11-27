require_relative "item_manager"
require_relative "store"

class Item
  include ItemStatus
  include ItemManager

  attr_accessor :name, :price, :status, :owner
  def initialize(name, price, owner=nil)
    @name = name
    @price = price
    @status = ItemStatus::CREATED
    @owner = owner
  end
end

@items = [
  Item.new("CPU", 40830, @store),
  Item.new("メモリー", 13880, @store),
  Item.new("マザーボード", 28980, @store),
  Item.new("電源ユニット", 8980, @store),
  Item.new("PCケース", 8727, @store),
  Item.new("3.5インチHDD", 10980, @store),
  Item.new("2.5インチSSD", 13370, @store),
  Item.new("M.2 SSD", 12980, @store),
  Item.new("CPUクーラー", 13400, @store),
  Item.new("グラフィックボード", 23800, @store),
]