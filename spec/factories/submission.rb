FactoryGirl.define do
  factory :submission do
    user
    to_email { user.email }
    data do
      (1..10).map do
        [Faker::Lorem.characters(6), Faker::Lorem.characters(6)]
      end.to_h
    end
  end
end
