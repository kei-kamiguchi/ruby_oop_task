class Item
  attr_accessor :name, :price, :owner
  def initialize(name, price)
    @name = name
    @price = price
    @owner = nil
  end
end
