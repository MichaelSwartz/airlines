require 'rails_helper'

feature "paginating airlines" do
  scenario "user visits index and does not see 26th airline" do
    24.times do
      airline = FactoryGirl.create(:airline)
      FactoryGirl.create(:review, airline: airline, rating: 3)
    end

    second_page = FactoryGirl.create(:airline, name: "second_page_air")
    FactoryGirl.create(:review, airline: second_page, rating: 1)
    visit airlines_path

    expect(page).to_not have_content("second_page_air")
  end

  scenario "user clicks next to see 26th airline" do
    24.times do
      airline = FactoryGirl.create(:airline)
      FactoryGirl.create(:review, airline: airline, rating: 3)
    end

    second_page = FactoryGirl.create(:airline, name: "second_page_air")
    FactoryGirl.create(:review, airline: second_page, rating: 1)

    visit airlines_path

    click_on 'Next'

    expect(page).to have_content("second_page_air")
  end
end
