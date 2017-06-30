FactoryGirl.define do
  factory :user do
    email
    password

    trait :confirmed do
      confirmed_at Time.now
    end
  end
end
