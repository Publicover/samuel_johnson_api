FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email 'name@place.com'
    password password
  end
end
