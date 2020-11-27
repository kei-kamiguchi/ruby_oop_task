require_relative "wallet"
require_relative "cart"
require_relative "user"
require "kosi"

class Customer < User
  attr_reader :name, :wallet, :cart

  def initialize(name)
    super(name)
    @wallet = Wallet.new(self)
    @cart = Cart.new(self)
  end

  def shopping(items)
    return if items.empty?
    print_items(items)
    puts "商品番号を入力してください"
    number = gets.to_i
    puts "商品数量を入力してください"
    quantity = gets.to_i
    cart.add(items[number], quantity)
    puts "カートの中身を確認しますか？(yes/no)"
    cart.print_contents if gets.chomp == "yes"
  end

  def checkout
    return if cart.contents.empty? 
    cart.print_contents
    puts "購入を確定しますか？(yes/no)"
    if gets.chomp == "yes"
      cart.contents.each do |content|
        wallet.withdraw_to(
          content.item_price * content.quantity,
          content.owner.wallet
        )
      end
    end
  end

  private

  def print_items(items)
    puts "📜 商品リスト"
    kosi = Kosi::Table.new({header: %w{番号, 商品名 金額}})
    print kosi.render(
      items.map.with_index do |item, index|
        [
          index,
          item.name,
          item.price
        ]
      end
    )
  end

end
