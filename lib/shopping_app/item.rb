class Item
  attr_accessor :name, :price, :owner
  def initialize(name, price, owner)
    @name = name
    @price = price
    @owner = owner
  end
end
