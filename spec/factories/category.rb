FactoryBot.define do
  factory :category do
    name { 'Sample Category' }
    icon { 'Sample Icon' }
    user
  end
end
