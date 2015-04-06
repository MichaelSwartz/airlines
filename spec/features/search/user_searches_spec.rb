require 'rails_helper'

feature "user searches for text" do
  scenario "user searches" do
    user = FactoryGirl.create(:user, email: 'Blue@blue.com')
    airline = FactoryGirl.create(:airline)
    review = FactoryGirl.create(:review, body: 'Blue airlines....')

    visit airlines_path
    fill_in "query", with: "Blue"
    click_button "Search"

save_and_open_page

    expect(page).to have_content(airline.name)
    expect(page).to have_content(user.email)
    expect(page).to have_content(review.body)
  end
end
