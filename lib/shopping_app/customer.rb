require_relative "user"
require_relative "wallet"
require_relative "cart"

class Customer < User
  attr_reader :wallet, :cart

  def initialize(name)
    super(name)
    @wallet = Wallet.new(self)
    @cart = Cart.new(self)
  end

end
