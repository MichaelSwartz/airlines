require 'rails_helper'

feature "creating an airline" do
  scenario "succesfully creates airline" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"

    visit root_path
    click_on "Create New Airline"

    fill_in "Name", with: "Example Airline"
    fill_in "Link URL", with: "www.example.com"
    fill_in "Logo URL", with: "http://img4.wikia.nocookie.net/__cb20110201093102/logopedia/images/f/f5/Logo1929.gif"
    click_on "Add Airline"

    expect(page).to have_content("New Airline Added")
    expect(page).to have_content("Example Airline")
    expect(page).to have_link('Go to Airline Website', href: 'www.example.com')
    expect(page).to have_xpath("//img[contains(@src,\"http://img4.wikia.nocookie.net/__cb20110201093102/logopedia/images/f/f5/Logo1929.gif\")]")

  end

  scenario "fails to create airline" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"

    visit root_path
    click_on "Create New Airline"

    fill_in "Name", with: ""
    fill_in "Link URL", with: "example.com"
    fill_in "Logo URL", with: "example-logo.com"
    click_on "Add Airline"
    expect(page).to have_content("Name can't be blank")
  end

  scenario "user attempts to create duplicate airline, but the code says oh no you ditint" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:airline, name: 'Delta Airlines')

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"

    visit root_path
    click_on "Create New Airline"

    fill_in "Name", with: "Delta Airlines"
    fill_in "Link URL", with: "example.com"
    fill_in "Logo URL", with: "example-logo.com"
    click_on "Add Airline"
    expect(page).to have_content("Name has already been taken")
  end
end
