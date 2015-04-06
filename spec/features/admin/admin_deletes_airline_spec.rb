require 'rails_helper'

feature 'admin manages airline details' do
  scenario 'admin deletes airline from page' do
    admin = FactoryGirl.create(:admin)
    airline = FactoryGirl.create(:airline)
    sign_in_as(admin)

    visit admin_airline_path(airline)
    click_on 'Delete'

    expect(page).to have_content('Airline deleted')
  end
end
