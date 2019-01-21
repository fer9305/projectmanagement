FactoryGirl.define do
  factory :task do
    name { Faker::Team.name }
    deadline { Faker::Date.forward(23) }
    done false
    project create(:project)
  end
end