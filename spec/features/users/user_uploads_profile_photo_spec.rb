require 'rails_helper'


feature 'user registers', %Q{
  As a visitor
  I want to register
  So that I can create an account
  and upload a prifile photo
} do

  scenario 'provide valid registration information with profile photo' do
    visit new_user_registration_path

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    attach_file "Profile photo", 'spec/fixtures/images.png'
    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
    click_link('Profile')
    user = User.find_by(email: 'john@example.com' )
    path = "uploads/user/profile_photo/#{user.id}/images.png"
    expect(page).to have_xpath("//img[contains(@src,#{path})]")
  end
end
