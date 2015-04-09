require 'rails_helper'

feature "user searches for text" do
  scenario "user searches" do
    airline = FactoryGirl.create(:airline)
    review = FactoryGirl.create(:review, body: 'Blue airlines....')

    visit root_path
    fill_in "query", with: "Blue"
    click_button "Search"

    expect(page).to have_content(airline.name)
    expect(page).to have_content(review.body)
  end
end
