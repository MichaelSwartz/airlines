require 'rails_helper'

feature 'user creates review and airline owner is notified via email ', %Q{
  As an airline owner
  I want to be notified
  when my airline is reviewed
} do

  scenario "review a product" do
    # Clear out any previously delivered emails
    ActionMailer::Base.deliveries.clear

    airline = FactoryGirl.create(:airline)
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit airline_path(airline)

    select('1', from: 'Rating:')
    fill_in 'Description', with: 'I like this airline'
    click_button 'Submit review'

    expect(page).to have_content('I like this airline')
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
