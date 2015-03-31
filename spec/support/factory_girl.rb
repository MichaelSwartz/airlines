require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :review do
    sequence(:body) {|n| "Some content #{n}" }
    rating '3'
    user_id 1
  end

end
