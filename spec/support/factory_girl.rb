require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :airline do
    name 'Airline name'
    description 'example description'
    link_url 'www.url.com'
    logo_url 'www.image.com'
  end

  factory :review do
    sequence(:body) {|n| "Some content #{n}" }
    rating '3'
    user_id 1
  end

end