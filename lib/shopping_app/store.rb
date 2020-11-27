class Store
  attr_reader :name, :items, :wallet

  def initialize(name)
    @name = name
    @items = []
    @wallet = Wallet.new(self)
  end

  def stock(item)
    items << item
  end
end