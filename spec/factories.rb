FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
    
    factory :admin do
      admin true
    end
  end
    
  factory :record do
    content { Faker::Lorem.sentence(5) }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    weather { ['晴', '曇', '雨', '雪'].sample }
    date 1.day.ago
    user
  end
end