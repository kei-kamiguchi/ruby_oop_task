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
  customer.shopping(store.items)
  puts "買い物を終了しますか？(yes/no)"
  end_shopping = gets.chomp == "yes"
end

customer.checkout
binding.irb

puts "終了"
