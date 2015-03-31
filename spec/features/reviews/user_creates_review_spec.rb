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

  scenario 'User successfully creates review' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    visit new_review_path
    select('1', from: 'Rating:')
    fill_in 'Body', with: 'I like this airline'
    click_button 'Submit review'

    expect(page).to have_content('Review successfully created')
    expect(page).to have_content("Rating: 1")
    expect(page).to have_content('I like this airline')
  end

  scenario 'User successfully creates review' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    visit new_review_path

    click_button 'Submit review'

    expect(page).to have_content('Rating can\'t be blank')
  end



end
