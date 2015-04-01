require 'rails_helper'

feature "paginating reviews" do
  scenario "user visits index and does not see 26th review" do
    airline = FactoryGirl.create(:airline, name: 'Dope Air')
    user = FactoryGirl.create(:user)

    25.times do
      FactoryGirl.create(:review,
        user: user,
        rating: (rand(1..4)),
        body: Faker::Lorem.sentence,
        airline: airline
      )
    end

    FactoryGirl.create(:review,
      user: user,
      rating: (rand(1..4)),
      body: 'second_page_review',
      airline: airline
    )

    visit airline_path(airline)

    expect(page).to_not have_content("second_page_review")
  end

  scenario "user clicks next to see 26th review" do
    airline = FactoryGirl.create(:airline, name: 'Dope Air')
    user = FactoryGirl.create(:user)

    25.times do
      FactoryGirl.create(:review,
        user: user,
        rating: (rand(1..4)),
        body: Faker::Lorem.words,
        airline: airline
      )
    end

    FactoryGirl.create(:review,
      user: user,
      rating: (rand(1..4)),
      body: 'second_page_review',
      airline: airline
    )

    visit airline_path(airline)

    click_on 'Next'

    expect(page).to have_content("second_page_review")
  end
end
