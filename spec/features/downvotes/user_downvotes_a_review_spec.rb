require 'rails_helper'

feature "user downvotes a review" do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario "user downvotes review" do
      airline = FactoryGirl.create(:airline)
      review = FactoryGirl.create(:review, airline: airline, user: user)
      visit airline_path(airline)
      click_link("downvote-#{review.id}")

      expect(page).to have_content('Downvote Created')
      expect(page).to have_content('-1')

    end
  end
end
