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
    check_cart_contents = gets.chomp == "yes"
    if check_cart_contents
      cart.print_contents
      check_cart_contents = false
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
