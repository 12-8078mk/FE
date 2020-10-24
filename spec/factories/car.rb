FactoryBot.define do
  factory :car do
    car_name {Faker::Name.name}
    image {Faker::Avatar.image}
    first_range {1}
    user
  end
end