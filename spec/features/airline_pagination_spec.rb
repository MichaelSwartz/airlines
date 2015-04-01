require 'rails_helper'

feature "paginating airlines" do
  scenario "user visits index and does not see 26th airline" do
    FactoryGirl.create_list(:airline, 25)

    FactoryGirl.create(:airline, name: "second_page_air")
    visit airlines_path

    expect(page).to_not have_content("second_page_air")
  end

  scenario "user clicks next to see 26th airline" do
    FactoryGirl.create_list(:airline, 25)

    FactoryGirl.create(:airline, name: "second_page_air")

    visit airlines_path

    click_on 'Next'

    expect(page).to have_content("second_page_air")
  end
end
