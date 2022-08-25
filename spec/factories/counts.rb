FactoryBot.define do
  factory :count do
    counts { '0' }
    association :user
  end

end