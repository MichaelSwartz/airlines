require 'rails_helper'

feature 'user creates review', %Q{
  As an authenticated user
  I want to update an a review for an airline
  So that I can correct errors or provide new information
} do
  scenario 'user reviews updates sucessfully' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:review)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit reviews_path

    click_link('Edit')

    select('1', from: 'Rating:')
    fill_in 'Body', with: 'I like this airline'
    click_button 'Edit review'

    expect(page).to have_content('Review successfully edited')
    expect(page).to have_content("Rating: 1")
    expect(page).to have_content('I like this airline')
  end

end
