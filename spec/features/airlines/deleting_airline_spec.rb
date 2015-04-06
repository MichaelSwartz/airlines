require 'rails_helper'

feature "deleting an airline" do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario "user should not see an option to delete airline" do
      delta = FactoryGirl.create(:airline,
        name: 'Awesome Airlines',
        description: 'greatest airline description text',
        user: user
      )

      visit airline_path(delta)
      click_on "Edit Airline"

      expect(page).to_not have_content('Delete Airline')
    end
  end
end
