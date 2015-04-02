require 'rails_helper'

feature 'admin deletes a review', %Q(
As an admin,
I want to navigate to an airline's review page
So that I can delete reviews
) do
  context 'admin' do
    scenario 'Deletes review' do
      airline = FactoryGirl.create(:airline, name: 'Dope Air')
      user = FactoryGirl.create(:admin)
      sign_in_as(user)

      reviews = []
      25.times do
        reviews << FactoryGirl.create(:review,
          user: user,
          rating: (rand(1..4)),
          body: Faker::Lorem.sentence,
          airline: airline
        )
      end

      deleted_review = reviews.sample
      visit admin_airline_path(airline)

      click_link(deleted_review.id)
      expect(page).to have_content('The review has been deleted')
      expect(page).to_not have_content("To be deleted")
    end
  end

end
