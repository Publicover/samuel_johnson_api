FactoryGirl.define do
  factory :word do
    name { Faker::Lorem.word }
    definition { Faker::Lorem.word }
  end
end
