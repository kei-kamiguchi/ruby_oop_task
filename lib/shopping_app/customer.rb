require_relative "wallet"
require_relative "cart"
require_relative "user"
require_relative "item_manager"

class Customer < User
  include ItemManager

  attr_reader :name, :wallet, :cart

  def initialize(name)
    super(name)
    @wallet = Wallet.new(self)
    @cart = Cart.new(self)
  end

  def check_out
    return false if wallet.balance < cart.total_amount
    cart.items.each do |item|
      money_to_pay = wallet.withdraw(item.price)
      item.owner.wallet.deposit(money_to_pay)
      item.owner = self
    end
    cart.items.clear
    true
  end

end
