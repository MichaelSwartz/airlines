require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'

    factory :admin do
      admin true
    end

  end

  factory :airline do
    sequence(:name) { |n| "Jet Blue #{n}" }
    description 'BLue airline'
    link_url 'www.url.com'
    logo_url 'www.image.com'
    user
  end

  factory :review do
    sequence(:body) { |n| "Some content #{n}" }
    rating '3'
    user
    airline
  end

end
