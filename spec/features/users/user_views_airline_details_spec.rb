require 'rails_helper'

feature "Airline Feature page" do
  scenario "User views Airline information" do
    delta = FactoryGirl.create(:airline, name: 'Delta Airlines', logo_url: "http://img4.wikia.nocookie.net/__cb20110201093102/logopedia/images/f/f5/Logo1929.gif")
    visit airline_path(delta)

    expect(page).to have_content('Delta Airlines')
    expect(page).to have_content('Blue airline')
    expect(page).to have_link('Go to Airline Website', href: 'www.url.com')
    expect(page).to have_xpath("//img[contains(@src,\"http://img4.wikia.nocookie.net/__cb20110201093102/logopedia/images/f/f5/Logo1929.gif\")]")
  end
end
