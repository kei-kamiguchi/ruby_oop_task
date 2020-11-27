require_relative "shopping_app/store"
require_relative "shopping_app/item"
require_relative "shopping_app/customer"

a_store = Store.new("Aストア")
[
  Item.new("CPU", 40830),
  Item.new("メモリー", 13880),
  Item.new("マザーボード", 28980),
  Item.new("電源ユニット", 8980),
].each{|item| a_store.stock(item) }

b_store = Store.new("Bストア")
[
  Item.new("PCケース", 8727),
  Item.new("3.5インチHDD", 10980),
  Item.new("2.5インチSSD", 13370),
  Item.new("M.2 SSD", 12980),
].each{|item| b_store.stock(item) }

c_store = Store.new("Cストア")
[
  Item.new("CPUクーラー", 13400),
  Item.new("グラフィックボード", 23800),
].each{|item| c_store.stock(item) }


binding.irb

items = (a_store.items + b_store.items + c_store.items).flatten

puts "あなたの名前を教えてください"
customer = Customer.new(gets.chomp)

puts "ウォレットにチャージする金額を入力にしてください"
customer.wallet.deposit(gets.chomp.to_i)

puts "ショッピングを開始します"
end_shopping = false
while !end_shopping do
  customer.shopping(items)
  puts "買い物を終了しますか？(yes/no)"
  end_shopping = gets.chomp == "yes"
end

customer.checkout

puts "終了"
