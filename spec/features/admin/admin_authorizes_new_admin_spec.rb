require 'rails_helper'

feature 'authorize new admin' do
  context 'signed in as admin' do
    scenario 'succesfully authorize new admin' do
      admin = FactoryGirl.create(:admin)
      user = FactoryGirl.create(:user)

      sign_in_as(admin)
      visit admin_users_path
      click_on user.email
      click_on 'Authorize as Admin'

      expect(page).to have_content('New admin authorized')
      expect(page).to have_content("#{user.email} Admin")
    end
  end
end
