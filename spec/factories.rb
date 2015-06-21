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
    content "Lorem ipsum"
    lat "40.1"
    lng "45.2"
    weather "雨"
    date "7/1"
    user
  end
end