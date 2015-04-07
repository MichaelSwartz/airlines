require 'rails_helper'

feature 'admin signs in' do
  scenario 'specify admin credentials' do
    admin = FactoryGirl.create(:admin)
    visit new_user_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Log in'
    expect(page).to have_content("Admin")
  end
end
