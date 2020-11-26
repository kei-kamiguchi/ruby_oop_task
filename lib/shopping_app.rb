require_relative "shopping_app/store"
require_relative "shopping_app/item"
require_relative "shopping_app/customer"

a_store = Store.new("Aストア")
[
  Item.new("CPU", 40830, a_store),
  Item.new("メモリー", 13880, a_store),
  Item.new("マザーボード", 28980, a_store),
  Item.new("電源ユニット", 8980, a_store),
].each{|item| a_store.stock_item(item) }

b_store = Store.new("Bストア")
[
  Item.new("PCケース", 8727, b_store),
  Item.new("3.5インチHDD", 10980, b_store),
  Item.new("2.5インチSSD", 13370, b_store),
  Item.new("M.2 SSD", 12980, b_store),
].each{|item| b_store.stock_item(item) }

c_store = Store.new("Cストア")
[
  Item.new("CPUクーラー", 13400, c_store),
  Item.new("グラフィックボード", 23800, c_store),
].each{|item| c_store.stock_item(item) }

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

customer.cart.purchase

puts "終了"
