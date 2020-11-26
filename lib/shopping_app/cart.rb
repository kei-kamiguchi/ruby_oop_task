require "kosi"

class Cart
  attr_reader :owner, :contents
  Struct.new("Content", :item_name, :item_price, :quantity, :owner)

  def initialize(owner)
    @owner = owner
    @contents = []
  end

  def add(item, quantity)
    return unless item && quantity
    contents << Struct::Content.new(item.name, item.price, quantity, item.owner)
  end

  def total_amount
    return 0 if empty_contents?
    contents.sum{|content| content.item_price * content.quantity }
  end

  def purchase
    return if empty_contents?
    print_contents
    puts "購入を確定しますか？(yes/no)"
    if gets.chomp == "yes"
      contents.each do |content|
        owner.wallet.withdraw_to(
          content.item_price * content.quantity,
          content.owner.wallet
        )
      end
    end
  end

  def print_contents
    return if empty_contents?
    puts "🛒　カートの中身"
    kosi = Kosi::Table.new({header: %w{商品名 金額 数量}})
    print kosi.render(
      contents.map do |content|
        [
          content.item_name,
          content.item_price,
          content.quantity
        ]
      end
    )
    puts "合計金額：#{total_amount}"
  end

  private

  def empty_contents?
    contents.empty?
  end

end