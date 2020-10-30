FactoryBot.define do
  factory :infomation do
    refuel {Faker::Number.number(4)}
    cost {Faker::Number.number(4)}
    trip {Faker::Number.number(4)}
    refuelday {Faker::Date.in_date_period}
    fueltype_id {1}
    user
    car
  end
end