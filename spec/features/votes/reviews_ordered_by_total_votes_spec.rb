require 'rails_helper'

feature 'user views reviews in order of total votes' do
  scenario 'user visits airline page' do
    airline = FactoryGirl.create(:airline, name: 'Dope Air')
    user = FactoryGirl.create(:user)

    not_seen_review = FactoryGirl.create(:review,
      user: user,
      rating: (rand(1..4)),
      body: 'second_page_review',
      airline: airline
    )

    25.times do
      FactoryGirl.create(:review,
        user: user,
        rating: (rand(1..4)),
        body: Faker::Lorem.sentence,
        airline: airline
      )
    end
    FactoryGirl.create(:vote, user: user, review: not_seen_review, value: -1)
    sign_in_as(user)
    visit airline_path(airline)
    expect(page).to_not have_content('Upvote -1 Downvote')
  end
end
