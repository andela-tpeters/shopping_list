FactoryGirl.define do
  factory :shopping_list do
    title Faker::Lorem.word
    user_id 1
  end
end
