require_relative "store"
require_relative "item_status"

class Item
  include ItemStatus

  attr_accessor :name, :price, :status, :owner

  @@instances = []

  def initialize(name, price, owner=nil)
    @name = name
    @price = price
    @status = ItemStatus::CREATED
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