FactoryBot.define do
  factory :attendance do
    stripe_customer_id { Faker::Number.number(10) }
    event_id { FactoryBot.create(:event).id }
    user_id { FactoryBot.create(:user).id }
  end
end
