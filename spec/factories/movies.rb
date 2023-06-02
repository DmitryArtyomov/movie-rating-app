FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    director { Faker::Name.name }
    year { rand(1950..2023) }
    description { Faker::Lorem.paragraph(sentence_count: 10) }
    image_url { Faker::LoremFlickr.image(size: '300x600') }

    transient do
      genres_count { 2 }
    end

    genres { build_list :genre, genres_count }
  end
end
