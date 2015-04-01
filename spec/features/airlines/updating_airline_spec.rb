require 'rails_helper'

feature "updating an airline" do

  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario "update page correctly populates information" do
      delta = FactoryGirl.create(:airline, name: 'Awesome Airlines', description: 'greatest airline description text', user: user )
      visit airline_path(delta)

      click_on "Edit Airline"

      expect(find_field('Name').value).to eq('Awesome Airlines')
      expect(find_field('Link URL').value).to eq('www.url.com')
      expect(find_field('Logo URL').value).to eq('www.image.com')
      expect(find_field('Description').value).to eq('greatest airline description text')
    end

    scenario "succesfully update airline information" do
      delta = FactoryGirl.create(:airline)
      visit airline_path(delta)

      click_on "Edit Airline"

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

  scenario "fails to update with empty name" do
    delta = FactoryGirl.create(:airline)
    visit airline_path(delta)

    click_on "Edit Airline"

    fill_in "Name", with: ""

    click_on "Update Airline"

    expect(page).to have_content("Name can't be blank")
  end

  scenario "fails to update with duplicate name" do
    delta = FactoryGirl.create(:airline)
    FactoryGirl.create(:airline, name: 'Delta')
    visit airline_path(delta)

    click_on "Edit Airline"

    fill_in "Name", with: "Delta"

    click_on "Update Airline"

    expect(page).to have_content("Name has already been taken")
  end
 end
end
