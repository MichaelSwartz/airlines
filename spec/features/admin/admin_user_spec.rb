require 'rails_helper'

feature 'admin users section' do
  context 'user signed in as admin' do
    let(:admin) { FactoryGirl.create(:admin) }

    before :each do
      sign_in_as admin
    end

    scenario 'admin views a list of users' do
      users = []

      25.times do
        users << FactoryGirl.create(:user)
      end

      visit admin_users_path

      expect(page).to have_content(users.first.email)
    end

    scenario 'admin views user details' do
      user = FactoryGirl.create(:user)
      airline = FactoryGirl.create(:airline)
      review = FactoryGirl.create(:review,
        airline_id: airline.id, user_id: user.id
      )

      visit admin_users_path
      click_on user.email

      expect(page).to have_content(user.email)
      expect(page).to have_content(review.body)
    end

    scenario 'admin deletes user' do
      user = FactoryGirl.create(:user)
      visit admin_users_path
      click_on user.email
      click_on 'Delete User'
      expect(page).to have_content('User deleted')
    end
  end
end
