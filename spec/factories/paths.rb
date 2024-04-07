FactoryBot.define do
  factory :path do
    journey
    delivery_date { Date.today }
    start_time { Time.now }
    end_time { 2.hours.from_now }
  end
end
