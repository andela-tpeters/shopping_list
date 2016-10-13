FactoryGirl.define do
  factory :item do
    task Faker::Lorem.sentence
    shopping_list_id 1
  end
end
