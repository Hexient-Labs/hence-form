FactoryGirl.define do
  sequence :email do |n|
    "user-#{n}@example.com"
  end

  sequence :password do |n|
    "RollingInTheDeep#{n}!!"
  end

  sequence :us_phone_number do |n|
    num = 15_550_000_000 + n
    "+#{num}"
  end

  trait :with_location do
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    addressline1 { Faker::Address.street_address }
    addressline2 { Faker::Address.secondary_address if [true, false].sample }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip { Faker::Address.zip }
    country "US"
    place_id { SecureRandom.hex(12) }
  end
end
