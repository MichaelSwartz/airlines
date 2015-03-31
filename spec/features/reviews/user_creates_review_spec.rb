require 'rails_helper'

feature 'user creates review', %Q{
  As an authenticated user
  I want to add an airline
  So that others can review it
} do

  #Acceptance criteria
  #I must be signed in before I can add a review for an airline
  #If I'm not signed in I must be presented an error message
  #I must be presented with a form to review an airline
  #In the form I must include a rating. Optionally I can include a comment
  #I must be presented with an error if I do not include a rating in my review
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'User successfully creates review' do

      airline = FactoryGirl.create(:airline)

      visit airline_path(airline.id)
      save_and_open_page

      select('1', from: 'Rating:')
      fill_in 'Body', with: 'I like this airline'
      click_button 'Submit review'

      expect(page).to have_content('Review successfully created')
      expect(page).to have_content("Rating: 1")
      expect(page).to have_content('I like this airline')
    end

    scenario 'User tries to create review' do

      airline = FactoryGirl.create(:airline)

      visit airline_path(airline.id)

      click_button 'Submit review'

      expect(page).to have_content('Rating can\'t be blank')
    end
  end
end
