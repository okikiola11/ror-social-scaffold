FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    name { 'kikiola' }
    password { 'kikiola' }
  end
end
