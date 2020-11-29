class Item
  attr_reader :name, :price
  attr_accessor :owner

  @@instances = []

  def initialize(name, price, owner=nil)
    @name = name
    @price = price
    @owner = owner

    @@instances << self
  end

  def label
    { name: name, price: price }
  end

  def self.all
    @@instances
  end

end