require_relative "wallet"
require_relative "item_manager"

class Store
  include ItemManager

  attr_reader :name, :wallet

  def initialize(name)
    @name = name
    @wallet = Wallet.new(self)
  end
end