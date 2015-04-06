require 'rails_helper'

feature "user upvotes a review for the second time" do
  context 'as an authorized user' do
    let(:user) {FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario "user upvotes review twice" do
      airline = FactoryGirl.create(:airline)
      review = FactoryGirl.create(:review, airline: airline, user: user)
      visit airline_path(airline)
      click_link("upvote-#{review.id}")
      click_link("upvote-#{review.id}")

      expect(page).to have_content('You\'ve already upvoted!')
      expect(page).to have_content('Upvote 1')

    end
  end

  context 'as a visitor' do
    scenario 'vistor tries to upvote a review' do
      user = FactoryGirl.create(:user)
      airline = FactoryGirl.create(:airline)
      review = FactoryGirl.create(:review, airline: airline, user: user)
      visit airline_path(airline)
      click_link("upvote-#{review.id}")

      expect(page).to have_content('You need to be logged in to vote!')
    end
  end
end

