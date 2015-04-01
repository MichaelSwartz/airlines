require 'rails_helper'

feature "deleting an airline" do

  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

  scenario "airline is deleted and confirmation is displayed" do
    delta = FactoryGirl.create(:airline, name: 'Awesome Airlines', description: 'greatest airline description text', user: user )
    visit airline_path(delta)

    click_on "Edit Airline"
    click_on "Delete Airline"
    #add js popup?
    expect(page).to have_content('Airline deleted')
    expect(page).to_not have_content('Awesome Airlines')
  end
 end
end
