# require 'rails_helper'
#
# feature "creating an airline" do
#   scenario "succesfully creates airline" do
#     user = FactoryGirl.create(:user)
#
#     visit new_user_session_path
#     fill_in "Email", with: user.email
#     fill_in "Password", with: user.password
#     click_on "Log in"
#
#     visit root_path
#     click_on "Create New Airline"
#
#     fill_in "Name", with: "Example Airline"
#     fill_in "Link URL", with: "example.com"
#     fill_in "Logo URL", with: "example-logo.com"
#     click_on "Add Airline"
#
#     expect(page).to have_content("New Airline Added")
#     expect(page).to have_content("Example Airline")
#   end
#
#   scenario "fails to create airline" do
#     user = FactoryGirl.create(:user)
#
#     visit new_user_session_path
#     fill_in "Email", with: user.email
#     fill_in "Password", with: user.password
#     click_on "Log in"
#
#     visit root_path
#     click_on "Create New Airline"
#
#     fill_in "Name", with: ""
#     fill_in "Link URL", with: "example.com"
#     fill_in "Logo URL", with: "example-logo.com"
#     click_on "Add Airline"
#     expect(page).to have_content("Name cannot be blank")
#   end
# end
