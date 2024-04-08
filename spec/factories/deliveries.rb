FactoryBot.define do
  factory :delivery do
    path
    description { "Delivery description" }
    signature { "example signature" }
    sender_first_name { "Diego" }
    sender_last_name { "Cuevas" }
  end
end
