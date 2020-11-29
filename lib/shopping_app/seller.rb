require_relative "user"
require_relative "wallet"
require_relative "item_manager"

class Seller < User
  include ItemManager

  attr_reader :wallet

  def initialize(name)
    super(name)
    @wallet = Wallet.new(self)
  end

end