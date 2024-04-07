FactoryBot.define do
  factory :delivery do
    path
    description { "Delivery description" }
    status { :pending }
    delivery_date { Date.today }
    delivery_time { Time.now }
  end
end
