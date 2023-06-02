FactoryBot.define do
  factory :genre do
    name { Faker::Hobby.activity }
  end
end
