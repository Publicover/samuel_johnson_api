FactoryGirl.define do
  factory :definition do
    name { Faker::StarWars.character }
    word_id nil
  end
end
