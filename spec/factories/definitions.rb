FactoryGirl.define do
  factory :definition do
    name { Faker::StarWars.character }
    todo_id nil
  end
end
