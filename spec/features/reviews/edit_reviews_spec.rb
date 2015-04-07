require 'rails_helper'

feature 'editing reviews' do
  context 'as a user who has submitted reviews' do
    let(:airline) { FactoryGirl.create(:airline) }
    let(:user) { FactoryGirl.create(:user) }
    let!(:my_review) { FactoryGirl.create(:review, airline: airline, user: user) }
    let!(:other_review) { FactoryGirl.create(:review, airline: airline) }

    before :each do
      sign_in_as user
    end

    scenario 'User sees edit button next to review that she created' do
      visit airline_path(airline)

      expect(page).to have_link('Edit', href: "/airlines/#{airline.id}/reviews/#{my_review.id}")
    end

    scenario 'User does not see edit button for reviews created by others' do
      visit airline_path(airline)

      expect(page).to_not have_link('Edit', href: "/airlines/#{airline.id}/reviews/#{other_review.id}")
    end
  end
end
