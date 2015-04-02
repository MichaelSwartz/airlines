require 'rails_helper'

feature "Admin creates an airline" do

  context 'Admin creates airline' do
    let(:admin) { FactoryGirl.create(:admin) }

    before :each do
      sign_in_as admin
    end

    scenario "succesfully updates airline" do
      delta = FactoryGirl.create(:airline, name: 'Cheap-o-air')
      visit edit_admin_airline_path(delta)

      fill_in "Name", with: "Delta Airlines"
      fill_in "Link URL", with: "www.example.com"
      fill_in "Logo URL", with: "http://img4.wikia.nocookie.net/__cb20110201093102/logopedia/images/f/f5/Logo1929.gif"
      fill_in "Description", with: "delta flies planes!"

      click_on "Update Airline"

      expect(page).to have_content("Airline updated")
      expect(page).to have_content("Delta Airlines")
      expect(page).to have_link('Go to Airline Website', href: 'www.example.com')
      expect(page).to have_xpath("//img[contains(@src,\"http://img4.wikia.nocookie.net/__cb20110201093102/logopedia/images/f/f5/Logo1929.gif\")]")
      expect(page).to have_content("delta flies planes!")
    end
  end
end
