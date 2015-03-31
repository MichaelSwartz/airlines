require 'rails_helper'

feature 'user updates review', %Q{
  As an authenticated user
  I want to delete an review
  So that no one can review it
} do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'user deletes review successfully' do
     airline = FactoryGirl.create(:airline)
     review = FactoryGirl.create(:review, airline: airline, user: user)

     visit airline_path(airline)

     click_link('Delete')

     expect(page).to have_content('Review successfully deleted')
    end
 end

  context 'as a visitor' do
    scenario 'try to delete a review' do
     airline = FactoryGirl.create(:airline)
     user = FactoryGirl.create(:user)
     review = FactoryGirl.create(:review, airline: airline, user: user)
     visit airline_path(airline)

     expect(page).to_not have_content('Delete')
    end
  end
end
