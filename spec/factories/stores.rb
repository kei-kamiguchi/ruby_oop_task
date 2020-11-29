FactoryBot.define do
  factory :store do
    name { "store" }

    initialize_with { new(name) }
  end
end