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
    return 0 if contents.empty?
    contents.sum{|content| content.item_price * content.quantity }
  end

  def print_contents
    return if contents.empty?
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

end