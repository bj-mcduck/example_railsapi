FactoryBot.define do
  factory :product do
    name { Faker::Movie.title }
    price { Faker::Commerce.price }
    department

    trait :with_promotion do
      after(:create) do |product|
        create(:products_promotion, product: product, promotion: create(:promotion))
      end
    end
  end
end
