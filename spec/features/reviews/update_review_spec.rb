require 'rails_helper'

feature 'user updates review', %Q{
  As an authenticated user
  I want to update an a review for an airline
  So that I can correct errors or provide new information
} do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'user reviews updates sucessfully' do
      airline = FactoryGirl.create(:airline)
      FactoryGirl.create(:review, airline: airline, user: user)

      visit airline_path(airline)

      click_link('Edit')

      select('2', from: 'Rating:')
      fill_in 'Body', with: 'I like this airline a lot'
      click_button 'Edit review'

      expect(page).to have_content('Review successfully edited')
      expect(page).to have_content("2")
      expect(page).to have_content('I like this airline a lot')
    end

    scenario 'user does not provide rating' do
      airline = FactoryGirl.create(:airline)
      FactoryGirl.create(:review, airline: airline, user: user)

      visit airline_path(airline)

      click_link('Edit')

      select(nil, from: 'Rating:')
      click_button 'Edit review'

      expect(page).to have_content('Rating can\'t be blank')
    end
  end

  context 'as a visitor' do
    scenario 'try to update a review' do
      airline = FactoryGirl.create(:airline)
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:review, airline: airline, user: user)
      visit airline_path(airline)
      save_and_open_page

      expect(page).to_not have_content('Edit Review')
    end
  end
end
