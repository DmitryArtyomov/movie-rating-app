FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.username(specifier: 5..10, separators: %w[_ -]) }
    password { Faker::Internet.password }
  end
end
