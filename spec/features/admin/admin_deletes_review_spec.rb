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

      deleted_review = FactoryGirl.create(:review,
        user: user,
        rating: (rand(1..4)),
        body: "To be deleted",
        airline: airline)

      25.times do
        FactoryGirl.create(:review,
          user: user,
          rating: (rand(1..4)),
          body: Faker::Lorem.sentence,
          airline: airline
        )
      end

      visit admin_airline_path(airline)
save_and_open_page

      click_link(deleted_review.id)
      expect(page).to have_content('The review has been deleted')
      expect(page).to_not have_content("To be deleted")
    end
  end

end
