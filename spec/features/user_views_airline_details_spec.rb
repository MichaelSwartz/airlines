require 'rails_helper'

feature "Airline Feature page" do
  scenario "User views Airline information" do
    delta = FactoryGirl.create(:airline, name: 'Delta Airlines', )
    visit airline_path(delta)

    expect(page).to have_content('Delta Airlines')
    expect(page).to have_content('description')
    expect(page).to have_link('Go to Airline Website', href: 'www.url.com')
  end
end
