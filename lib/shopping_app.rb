require_relative "shopping_app/seller"
require_relative "shopping_app/item"
require_relative "shopping_app/customer"

seller = Seller.new("DICストア")
10.times{ Item.new("CPU", 40830, seller) }
10.times{ Item.new("メモリー", 13880, seller) }
10.times{ Item.new("マザーボード", 28980, seller) }
10.times{ Item.new("電源ユニット", 8980, seller) }
10.times{ Item.new("PCケース", 8727, seller) }
10.times{ Item.new("3.5インチHDD", 10980, seller) }
10.times{ Item.new("2.5インチSSD", 13370, seller) }
10.times{ Item.new("M.2 SSD", 12980, seller) }
10.times{ Item.new("CPUクーラー", 13400, seller) }
10.times{ Item.new("グラフィックボード", 23800, seller) }

puts "あなたの名前を教えてください"
customer = Customer.new(gets.chomp)

puts "ウォレットにチャージする金額を入力にしてください"
customer.wallet.deposit(gets.chomp.to_i)

puts "ショッピングを開始します"
end_shopping = false
while !end_shopping do
  puts "📜 商品リスト"
  seller.items_list

  puts "商品番号を入力してください"
  number = gets.to_i

  puts "商品数量を入力してください"
  quantity = gets.to_i

  items = seller.pick_items(number, quantity)

  items&.each{|item| customer.cart.add(item) }

  puts "カートの中身"
  customer.cart.items_list
  puts "合計金額: #{customer.cart.total_amount}"

  puts "買い物を終了しますか？(yes/no)"
  end_shopping = gets.chomp == "yes"
end

puts "購入を確定しますか？(yes/no)"
customer.cart.check_out if gets.chomp == "yes"

puts "終了"
