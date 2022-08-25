FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
    kind { Faker::Number.between(from: 0, to: 1) }
    genre { Faker::Number.between(from: 0, to: 1) }
    is_published { Faker::Number.between(from: 0, to: 1) }
    association :user

    after(:build) do |post|
      post.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end