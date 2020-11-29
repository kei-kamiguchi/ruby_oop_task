class Wallet
  attr_reader :owner, :balance

  def initialize(owner)
    @owner = owner
    @balance = 0
  end

  def deposit(amount)
    @balance += amount.to_i
  end

  def withdraw(amount)
    return unless enough_balance?(amount)
    @balance -= amount.to_i
    amount
  end

  private

  def enough_balance?(amount)
    if @balance >= amount
      true
    else
      puts "ウォレットに十分な残高がありません"
      false
    end
  end
end