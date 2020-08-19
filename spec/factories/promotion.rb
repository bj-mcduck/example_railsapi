FactoryBot.define do
  factory :promotion do
    active { Faker::Boolean.boolean }
    code { Faker::Hipster.word.upcase }
    discount { rand }
  end
end
