FactoryBot.define do
  factory :post do
    content { 'kikiola, is a new user on the app' }
    user_id { 1 }
  end
end
