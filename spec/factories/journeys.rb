FactoryBot.define do
  factory :journey do
    sequence(:name) { |n| "Journey #{n}" }
    origin { create(:location) }
    destination { create(:location) }
  end
end
