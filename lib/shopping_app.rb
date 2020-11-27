require_relative "shopping_app/store"
require_relative "shopping_app/item"
require_relative "shopping_app/customer"

binding.irb

puts "あなたの名前を教えてください"
customer = Customer.new(gets.chomp)

puts "ウォレットにチャージする金額を入力にしてください"
customer.wallet.deposit(gets.chomp.to_i)

puts "ショッピングを開始します"
end_shopping = false
while !end_shopping do
  customer.shopping(@items)
  puts "買い物を終了しますか？(yes/no)"
  end_shopping = gets.chomp == "yes"
end

customer.checkout
binding.irb

puts "終了"
