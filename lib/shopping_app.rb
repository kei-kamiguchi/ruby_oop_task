require_relative "shopping_app/store"
require_relative "shopping_app/item"
require_relative "shopping_app/customer"

store = Store.new("DICストア")
10.times{ Item.new("CPU", 40830, store) }
10.times{ Item.new("メモリー", 13880, store) }
10.times{ Item.new("マザーボード", 28980, store) }
10.times{ Item.new("電源ユニット", 8980, store) }
10.times{ Item.new("PCケース", 8727, store) }
10.times{ Item.new("3.5インチHDD", 10980, store) }
10.times{ Item.new("2.5インチSSD", 13370, store) }
10.times{ Item.new("M.2 SSD", 12980, store) }
10.times{ Item.new("CPUクーラー", 13400, store) }
10.times{ Item.new("グラフィックボード", 23800, store) }

puts "あなたの名前を教えてください"
customer = Customer.new(gets.chomp)

puts "ウォレットにチャージする金額を入力にしてください"
customer.wallet.deposit(gets.chomp.to_i)

puts "ショッピングを開始します"
end_shopping = false
while !end_shopping do
  puts "📜 商品リスト"
  store.items_list

  puts "商品番号を入力してください"
  number = gets.to_i

  puts "商品数量を入力してください"
  quantity = gets.to_i

  items = store.pick_items(number, quantity)

  items&.each{|item| customer.cart.add(item) }

  puts "カートの中身を確認しますか？(yes/no)"
  customer.cart.items_list if gets.chomp == "yes"
  puts "合計金額: #{customer.cart.total_amount}"

  puts "買い物を終了しますか？(yes/no)"
  end_shopping = gets.chomp == "yes"
end

puts "購入を確定しますか？(yes/no)"
customer.cart.items_list
puts "合計金額: #{customer.cart.total_amount}"

if customer.check_out
  puts "購入完了"
  customer.items_list
else
  puts "購入を正常に完了できませんでした"
end

binding.irb

puts "終了"
