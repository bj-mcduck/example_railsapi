FactoryBot.define do
  factory :department do
    name { Faker::Movie.title }
  end
end
