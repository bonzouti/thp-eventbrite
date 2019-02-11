FactoryBot.define do
  factory :event do
    start_date { Faker::Date.forward(10) }
    duration { 5 }
    title { Faker::HarryPotter.book }
    description { Faker::HarryPotter.quote }
    price { 100 }
    location { Faker::HarryPotter.location }
    user_id { FactoryBot.create(:user).id }
  end
end
