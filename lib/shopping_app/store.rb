require_relative "wallet"

class Store
  attr_reader :name, :items, :wallet

  def initialize(name)
    @name = name
    @items = []
    @wallet = Wallet.new(self)
  end

  def stock(item)
    item.owner = self
    items << item
  end
end

@store = Store.new("DICストア")