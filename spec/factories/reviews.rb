FactoryBot.define do
  factory :review do
    rating { rand(1..5) }
    text { Faker::Lorem.paragraph(sentence_count: 10) }
    movie
    user
  end
end
