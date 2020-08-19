FactoryBot.define do
  factory :product do
    name { Faker::Movie.title }
    price { Faker::Commerce.price }
    department
  end
end
