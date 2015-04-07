require 'rails_helper'

feature 'user updates profile', %Q{
  As a user
  I want to update my profile
  so that I can change my email
  and profile photo
} do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end
  scenario 'provide valid registration information with profile photo' do
    click_link('Profile')
    click_on('Update Account')

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'Current password', with: "#{user.password}"
    attach_file "Profile photo", 'spec/fixtures/images.png'
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
    click_link('Profile')
    path = "uploads/user/profile_photo/#{user.id}/images.png"
    expect(page).to have_xpath("//img[contains(@src,#{path})]")
  end
end
