FactoryGirl.define do
  factory :project do
    name { Faker::Team.name }
    start_date { Faker::Date.forward(23) }
  end
end