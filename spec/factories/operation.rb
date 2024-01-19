FactoryBot.define do
  factory :operation do
    name { 'Sample Oo' }
    amount { 122 }
    user
    category
  end
end
