FactoryBot.define do
  factory :item do
    name { "item" }
    price { 1000 }
    owner { build(:store) }

    initialize_with { new(name, price, owner) }
  end
end