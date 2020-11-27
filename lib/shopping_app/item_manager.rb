require "kosi"
require_relative "item"
require_relative "item_status"

module ItemManager
  def items
    Item.all.select{|item| item.owner == self }
  end

  def stock
    items
      .group_by{|item| { name: item.name, price: item.price } }
      .map.with_index do |label_and_items, index|
        {
          number: index,
          label: {
            name: label_and_items[0][:name],
            price: label_and_items[0][:price],
          },
          items: label_and_items[1],
        }
      end
  end

  def print_stock
    kosi = Kosi::Table.new({header: %w{番号 商品名 金額 数量}})
    print kosi.render(
      stock.map do |stock|
        [
          stock[:number],
          stock[:label][:name],
          stock[:label][:price],
          stock[:items].size
        ]
      end
    )
  end

  def trigger_payment
  end

  def trigger_delivery
  end
end