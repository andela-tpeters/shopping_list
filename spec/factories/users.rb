FactoryGirl.define do
  factory :user do
    email "correct@gmail.com"
    password "password"
    password_confirmation "password"
  end
end
