require_relative "store"

class Item
  attr_reader :name, :price, :quantity
  attr_accessor :owner

  @@instances = []

  def initialize(name, price, owner=nil)
    @name = name
    @price = price
    @owner = owner

    @@instances << self
  end

  def self.all
    @@instances
  end

  def label
    { name: name, price: price }
  end

end